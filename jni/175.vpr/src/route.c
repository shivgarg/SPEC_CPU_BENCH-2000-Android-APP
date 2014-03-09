#include <stdio.h>
#include <math.h>
#include "util.h"
#include "pr.h"
#include "ext.h" 
#include "route.h"
#include "place.h"
#include "rr_graph.h"
//#include "draw.h"    /* Temp. */


/********** Defines and types local to route.c *******************************/

struct s_heap {int index; float cost; union {int prev_node;
       struct s_heap *next;} u; int prev_edge;};

/* Used by the heap as its fundamental data structure.                 *
 * index:   Index (ID) of this routing resource node.                  *
 * cost:    Cost up to and including this node.                        *
 * u.prev_node:  Index (ID) of the predecessor to this node for        *
 *          use in traceback.  NO_PREVIOUS if none.                    *
 * u.next:  pointer to the next s_heap structure in the free           *
 *          linked list.  Not used when on the heap.                   *
 * prev_edge:  Index of the edge (between 0 and num_edges-1) used to   *
 *             connect the previous node to this one.  NO_PREVIOUS if  *
 *             there is no previous node.                              */


struct s_rr_node_route_inf {int prev_node; float cost; float path_cost;
     short prev_edge; short target_flag; };
 
/* Everything in this structure should be used in the actual maze expansion *
 * or other Steiner tree heuristic, since that is the most frequently       *
 * repeated step in routing.  Other node information not needed for         *
 * tree construction should be put in the rr_node_cost_inf array            *
 * (conserves memory bandwidth and cache for most CPU intensive routing     *
 * step).                                                                   *
 *                                                                          *
 * prev_node:  Index of the previous node used to reach this one;           *
 *             used to generate the traceback.  If there is no              *
 *             predecessor, prev_node = NO_PREVIOUS.                        *
 * cost:       Total cost of using this node.                               *
 * path_cost:  Total cost of the path up to and including this node.        *
 * prev_edge:  Index of the edge (from 0 to num_edges-1) that was used      *
 *             to reach this node from the previous node.  If there is      *
 *             no predecessor, prev_edge = NO_PREVIOUS.                     *
 * target_flag:  Is this node a target (sink) for the current routing?      *
 *               Number of times this node must be reached to fully route.  */



/**************** Static variables local to route.c **************************/

static struct s_heap **heap;  /* Indexed from [1..heap_size] */
static int heap_size;   /* Number of slots in the heap array */
static int heap_tail;   /* Index of first unused slot in the heap array */

/* For managing my own list of currently free heap data structures.     */
static struct s_heap *heap_free_head = NULL; 

/* For managing my own list of currently free trace data structures.    */
static struct s_trace *trace_free_head = NULL;

#ifdef DEBUG
 static int num_trace_allocated = 0;   /* To watch for memory leaks. */
 static int num_heap_allocated = 0;
 static int num_linked_f_pointer_allocated = 0;
#endif

static struct s_linked_f_pointer *rr_modified_head = NULL;
static struct s_linked_f_pointer *linked_f_pointer_free_head = NULL;

static struct s_bb *route_bb = NULL; /* [0..num_nets-1]. Limits area in which */
                                     /* each net must be routed.              */

struct s_rr_node_route_inf *rr_node_route_inf = NULL;  /* [0..num_rr_nodes-1] */



/*  The numbering relation between the channels and clbs is:              *
*                                                                         *
*  |   IO    | chan_   |   CLB      | chan_   |   CLB     |               *
*  |clb[0][2]| y[0][2] | clb[1][2]  | y[1][2] |  clb[2][2]|               *
*  +-------- +         +------------+         +-----------+               *
*                                                           } capacity in *
*   No channel          chan_x[1][1]          chan_x[2][1]  } chan_width  *
                                                            } _x[1]       *
*  +---------+         +------------+         +-----------+               *
*  |         | chan_   |            | chan_   |           |               *
*  |  IO     | y[0][1] |    CLB     | y[1][1] |   CLB     |               *
*  |clb[0][1]|         |  clb[1][1] |         | clb[2][1] |               *
*  |         |         |            |         |           |               *
*  +---------+         +------------+         +-----------+               *
*                                                           } capacity in *
*                      chan_x[1][0]           chan_x[2][0]  } chan_width  * 
*                                                           } _x[0]       *
*                      +------------+         +-----------+               *
*              No      |            | No      |           |               *
*            Channel   |    IO      | Channel |   IO      |               *
*                      |  clb[1][0] |         | clb[2][0] |               *
*                      |            |         |           |               *
*                      +------------+         +-----------+               *
*                                                                         *
*             {=======}              {=======}                            *
*            Capacity in            Capacity in                           *
*          chan_width_y[0]        chan_width_y[1]                         *
*                                                                         */


/********************* Subroutines local to route.c ***************************/

static void free_trace_data (struct s_trace *tptr);
static void free_heap_data (struct s_heap *hptr);
static void free_traceback (int inet);
static void init_route_structs (int bb_factor);
static void load_route_bb (int bb_factor); 
static void alloc_and_load_rr_node_route_structs (void);
static void free_rr_node_route_structs (void);

static boolean route_net (int inet, float bend_cost, enum e_route_type
         route_type); 
static void pathfinder_update_one_cost (int inet, int add_or_sub, 
       float pres_fac, float acc_fac);
static void pathfinder_update_cost (float pres_fac, float acc_fac);

static void mark_ends (int inet);
static void add_source_to_heap (int inet); 
static void expand_neighbours (int inode, float pcost, int inet, float 
            bend_cost);
static struct s_trace *update_traceback (struct s_heap *hptr, int inet);
static void empty_heap (void);
static void invalidate_heap_entries (int sink_node, int ipin_node); 

static void reset_path_costs (void); 
static void expand_trace_segment (struct s_trace *start_ptr, 
            int remaining_connections_to_sink);

static struct s_heap *get_heap_head (void); 
static struct s_trace *alloc_trace_data (void); 
static void node_to_heap (int inode, float cost, int prev_node, int prev_edge); 
static void add_to_heap (struct s_heap *hptr);
static struct s_heap *alloc_heap_data (void);
static void add_to_mod_list (float *fptr);
static struct s_linked_f_pointer *alloc_linked_f_pointer (void);


/************************** Subroutine definitions ***************************/

void save_routing (struct s_trace **best_routing) {

/* This routing frees any routing currently held in best routing,    *
 * then copies over the current routing (held in trace_head), and    *
 * finally sets trace_head and trace_tail to all NULLs so that the   *
 * connection to the saved routing is broken.  This is necessary so  *
 * that the next iteration of the router does not free the saved     *
 * routing elements.                                                 */

 int inet;
 struct s_trace *tptr, *tempptr;

 for (inet=0;inet<num_nets;inet++) {

/* Free any previously saved routing.  It is no longer best. */
    tptr = best_routing[inet];
    while (tptr != NULL) {
       tempptr = tptr->next;
       free_trace_data (tptr);
       tptr = tempptr;
    }

/* Save a pointer to the current routing in best_routing. */
    best_routing[inet] = trace_head[inet];

/* Set the current (working) routing to NULL so the current trace       *
 * elements won't be reused by the memory allocator.                    */

    trace_head[inet] = NULL;
    trace_tail[inet] = NULL;
 }
}


void restore_routing (struct s_trace **best_routing) {

/* Deallocates any current routing in trace_head, and replaces it with    *
 * the routing in best_routing.  Best_routing is set to NULL to show that *
 * it no longer points to a valid routing.  NOTE:  trace_tail is not      *
 * restored -- it is set to all NULLs since it is only used in            *
 * update_traceback.  If you need trace_tail restored, modify this        *
 * routine.                                                               */

 int inet;

 for (inet=0;inet<num_nets;inet++) {

   /* Free any current routing. */
    free_traceback (inet);

  /* Set the current routing to the saved one. */
   trace_head[inet] = best_routing[inet];
   best_routing[inet] = NULL;          /* No stored routing. */
 }
}


void get_serial_num (void) {

/* This routine finds a "magic cookie" for the routing and prints it.    *
 * Use this number as a routing serial number to ensure that programming *
 * changes do not break the router.                                      */

 int inet, serial_num, inode;
 struct s_trace *tptr;
 serial_num = 0;

 for (inet=0;inet<num_nets;inet++) {

/* Global nets will have null trace_heads (never routed) so they *
 * are not included in the serial number calculation.            */

    tptr = trace_head[inet];
    while (tptr != NULL) {
       inode = tptr->index;
       serial_num += (inet+1) * (rr_node[inode].xlow * (nx+1) - 
                      rr_node[inode].yhigh);

       serial_num -= rr_node[inode].ptc_num * (inet+1) * 10;

       serial_num -= rr_node[inode].type * (inet+1) * 100;
       serial_num %= 2000000000;  /* Prevent overflow */
       tptr = tptr->next;
    }
 }
 printf ("Serial number (magic cookie) for the routing is: %d\n",
    serial_num);
}


int try_route (int width_fac, struct s_router_opts router_opts, struct
        s_det_routing_arch det_routing_arch, struct s_segment_inf 
        *segment_inf, t_timing_inf timing_inf) {

/* Attempts a routing via an iterated maze router algorithm.  Width_fac *
 * specifies the relative width of the channels, while the members of   *
 * router_opts determine the value of the costs assigned to routing     *
 * resource node, etc.  det_routing_arch describes the detailed routing *
 * architecture (connection and switch boxes) of the FPGA; it is used   *
 * only if a DETAILED routing has been selected.                        */

 int inet, itry;
 boolean success, is_routable;
 float pres_fac;
/* char *msg = "Temp routing."; */  /* Temp !!!! */

 printf("\nAttempting routing with a width factor (usually maximum channel ");
 printf("width) of %d.\n",width_fac);

/* Set the channel widths */

 init_chan (width_fac);

/* Free any old routing graph, if one exists. */

/* for (itry=0;itry<10000;itry++) { */   /* Temp! */

/* printf ("Building graph #%d\n", itry);  */

 free_rr_graph ();

/* Set up the routing resource graph defined by this FPGA architecture. */

 build_rr_graph (router_opts.route_type, det_routing_arch, segment_inf,
                 timing_inf);

/* Allocate and load some additional rr_graph information needed only by *
 * the router.                                                           */

 alloc_and_load_rr_node_route_structs ();

/* }*/   /* Temp! */

/* free_rr_graph ();
 return (0);  */
 
 init_route_structs (router_opts.bb_factor);

/* init_draw_coords (6.); */  /* Temp !! */
/* update_screen (MAJOR, msg, ROUTING); */  /* Temp !!!! */


/* Iterated maze router ala Pathfinder Negotiated Congestion algorithm,  *
 * (FPGA 95 p. 111).                                                     */

/* Usually the first iteration uses a very small (or 0) pres_fac to find  *
 * the shortest path and get a congestion map.  For fast compiles, I set  *
 * pres_fac high even for the first iteration.                            */
 
 pres_fac = router_opts.first_iter_pres_fac;

 for (itry=1;itry<=router_opts.max_router_iterations;itry++) {
      
    pathfinder_update_cost (pres_fac, router_opts.acc_fac);

    for (inet=0;inet<num_nets;inet++) {
       if (is_global[inet] == 0) {       /* Skip global nets. */
 
          pathfinder_update_one_cost (inet, -1, pres_fac, router_opts.acc_fac);
          is_routable = route_net (inet, router_opts.bend_cost, 
                                   router_opts.route_type);

          /* Impossible to route? (disconnected rr_graph) */

          if (!is_routable) { 
             printf ("Routing failed.\n");
             free_rr_node_route_structs ();
             return (0);
          }

          pathfinder_update_one_cost (inet, 1, pres_fac, router_opts.acc_fac);

       } 
    } 
       
    success = feasible_routing ();
    if (success) {
       printf("Successfully routed after %d routing iterations.\n", itry);
       free_rr_node_route_structs ();
       return (1);
    }   
       
    if (itry == 1) 
       pres_fac = router_opts.initial_pres_fac;
    else 
       pres_fac *= router_opts.pres_fac_mult; 

 }

 printf ("Routing failed.\n");
 free_rr_node_route_structs ();
 return (0);
}


boolean feasible_routing (void) {

/* This routine checks to see if this is a resource-feasible routing.      *
 * That is, are all rr_node capacity limitations respected?  It assumes    *
 * that the occupancy arrays are up to date when it is called.             */

 int inode;

 for (inode=0;inode<num_rr_nodes;inode++) 
    if (rr_node_cost_inf[inode].occ > rr_node_cost_inf[inode].capacity)
       return (FALSE);

 return (TRUE);
}


static void pathfinder_update_one_cost (int inet, int add_or_sub, 
      float pres_fac, float acc_fac) {

/* This routine updates the occupancy and cost of the channel segments   *
 * and pins that are affected by the routing of net inet.  If add_or_sub *
 * is -1 the net is ripped up, if it is 1 the net is added to the        *
 * routing.  The size of pres_fac and acc_fac determine how severly      *
 * oversubscribed channels and pins are penalized.  The cost function    *
 * used is that of Pathfinder.                                           */

 struct s_trace *tptr;
 int inode, occ, capacity;
 float pcost;

 tptr = trace_head[inet];
 if (tptr == NULL)        /* No routing yet. */
    return;

 while (1) {
    inode = tptr->index;

    occ = rr_node_cost_inf[inode].occ + add_or_sub;
    capacity = rr_node_cost_inf[inode].capacity;

    rr_node_cost_inf[inode].occ = occ;

/* pcost is Pn in the Pathfinder paper.  The acc_cost member stores the  *
 * total number of segments that have overused this resource in all past *
 * iterations.  I set my pcost according to the overuse that would       *
 * result from having ONE MORE net use this routing node.                */

    if (occ < capacity) {
       pcost = 1.;
    }
    else {
       pcost = 1. + (occ + 1 - capacity) * pres_fac;
    }

    rr_node_route_inf[inode].cost = (rr_node_cost_inf[inode].base_cost + 
                rr_node_cost_inf[inode].acc_cost * acc_fac) * pcost;

    if (rr_node[inode].type == SINK) {
       tptr = tptr->next;             /* Skip next segment. */
       if (tptr == NULL)
          break;
    }

    tptr = tptr->next;
 
 }   /* End while loop -- did an entire traceback. */
}


static void pathfinder_update_cost (float pres_fac, float acc_fac) {

/* This routine recomputes the cost of each routing resource for the     *
 * pathfinder algorithm after all nets have been routed.  It updates     *
 * the accumulated cost to by adding in the number of extra signals      *
 * sharing a resource right now (i.e. after each complete iteration).    *
 * THIS ROUTINE ASSUMES THE OCCUPANCY VALUES IN RR_NODE ARE UP TO DATE.  */

 int inode, occ, capacity;
 float pcost;
 
 for (inode=0;inode<num_rr_nodes;inode++) {
    occ = rr_node_cost_inf[inode].occ;
    capacity = rr_node_cost_inf[inode].capacity;
    
    if (occ > capacity) {
       rr_node_cost_inf[inode].acc_cost += occ - capacity;
       pcost = 1. + (occ + 1 - capacity) * pres_fac;
       rr_node_route_inf[inode].cost = (rr_node_cost_inf[inode].base_cost + 
                   rr_node_cost_inf[inode].acc_cost * acc_fac) * pcost;
    }

/* If occ == capacity, we don't need to increase acc_cost, but a change    *
 * in pres_fac could have made it necessary to recompute the cost anyway.  */

    else if (occ == capacity) {
       pcost = 1. + pres_fac;
       rr_node_route_inf[inode].cost = (rr_node_cost_inf[inode].base_cost + 
                   rr_node_cost_inf[inode].acc_cost * acc_fac) * pcost;
    }

/* I assume acc_fac will be the same for all iterations, so there is no    *
 * need to recompute the cost of things with occ < capacity.  CHANGE IF    *
 * YOU WANT TO VARY ACC_FAC FROM ITERATION TO ITERATION.                   */
 }
}    


static void init_route_structs (int bb_factor) {

/* Call this before you route any nets.  It frees any old traceback and   *
 * sets the list of rr_nodes touched to empty.                            */

 int i;

 for (i=0;i<num_nets;i++)
    free_traceback (i);

 load_route_bb (bb_factor);

/* Check that things that should have been emptied after the last routing *
 * really were.                                                           */
 
 if (rr_modified_head != NULL) {
    printf ("Error in init_route_structs.  List of modified rr nodes is \n"
            "not empty.\n");
    exit (1);
 }

 if (heap_tail != 1) {
    printf ("Error in init_route_structs.  Heap is not empty.\n");
    exit (1);
 }
}


static boolean route_net (int inet, float bend_cost, enum e_route_type
         route_type) {

/* Uses a maze routing (Dijkstra's) algorithm to route a net.  The net       *
 * begins at the net output, and expands outward until it hits a target      *
 * pin.  The algorithm is then restarted with the entire first wire segment  *
 * included as part of the source this time.  For an n-pin net, the maze     *
 * router is invoked n-1 times to complete all the connections.  Inet is     *
 * the index of the net to be routed.  route_type is either GLOBAL or        *
 * DETAILED.  If GLOBAL routing is being performed, bends are penalized      *
 * by bend_cost, as they make detailed routing more difficult with           *
 * segmented routing architectures.  Otherwise bend_cost is ignored.         *
 * If this routine finds that a net *cannot* be connected (due to a complete *
 * lack of potential paths, rather than congestion), it returns FALSE, as    *
 * routing is impossible on this architecture.  Otherwise it returns TRUE.   */

 int i, inode, prev_node, remaining_connections_to_sink;
 float pcost, new_pcost;
 struct s_heap *current;
 struct s_trace *tptr;

 free_traceback (inet);
 add_source_to_heap (inet);
 mark_ends (inet);

 tptr = NULL;
 remaining_connections_to_sink = 0;
 
 for (i=1;i<net[inet].num_pins;i++) { /* Need n-1 wires to connect n pins */
    expand_trace_segment (tptr, remaining_connections_to_sink);
    current = get_heap_head();

    if (current == NULL) { /* Infeasible routing.  No possible path for net. */
       reset_path_costs ();  /* Clean up before leaving. */
       return (FALSE);
    }

    inode = current->index;

    while (rr_node_route_inf[inode].target_flag == 0) {
       pcost = rr_node_route_inf[inode].path_cost;
       new_pcost = current->cost;
       if (pcost > new_pcost) {      /* New path is lowest cost. */
          rr_node_route_inf[inode].path_cost = new_pcost;
          prev_node = current->u.prev_node;
          rr_node_route_inf[inode].prev_node = prev_node;
          rr_node_route_inf[inode].prev_edge = current->prev_edge;

          if (pcost > 0.99 * HUGE_FLOAT)          /* First time touched. */
             add_to_mod_list (&rr_node_route_inf[inode].path_cost);
          expand_neighbours (inode, new_pcost, inet, bend_cost);  
       }

       free_heap_data (current);
       current = get_heap_head ();

       if (current == NULL) { /* Impossible routing. No path for net. */
          reset_path_costs ();
          return (FALSE);
       }

       inode = current->index;
    }

    rr_node_route_inf[inode].target_flag--;    /* Connected to this SINK. */
    remaining_connections_to_sink = rr_node_route_inf[inode].target_flag;
    tptr = update_traceback (current, inet);
    free_heap_data (current);
 }

 empty_heap ();
 reset_path_costs ();
 return (TRUE);
}


static void expand_trace_segment (struct s_trace *start_ptr,
        int remaining_connections_to_sink) {

/* Adds all the rr_nodes in the traceback segment starting at tptr (and     *
 * continuing to the end of the traceback) to the heap with a cost of zero. *
 * This allows expansion to begin from the existing wiring.  The            *
 * remaining_connections_to_sink value is 0 if the route segment ending     *
 * at this location is the last one to connect to the SINK ending the route *
 * segment.  This is the usual case.  If it is not the last connection this *
 * net must make to this SINK, I have a hack to ensure the next connection  *
 * to this SINK goes through a different IPIN.  Without this hack, the      *
 * router would always put all the connections from this net to this SINK   *
 * through the same IPIN.  With LUTs or cluster-based logic blocks, you     *
 * should never have a net connecting to two logically-equivalent pins on   *
 * the same logic block, so the hack will never execute.  If your logic     *
 * block is an and-gate, however, nets might connect to two and-inputs on   *
 * the same logic block, and since the and-inputs are logically-equivalent, *
 * this means two connections to the same SINK.                             */

 struct s_trace *tptr, *next_ptr; 
 int inode, sink_node, last_ipin_node;

 tptr = start_ptr;

 if (remaining_connections_to_sink == 0) {   /* Usual case. */
    while (tptr != NULL) {         
       node_to_heap (tptr->index, 0., NO_PREVIOUS, NO_PREVIOUS);
       tptr = tptr->next;
    }
 }
 
 else {   /* This case never executes for most logic blocks. */

/* Weird case.  Lots of hacks. The cleanest way to do this would be to empty *
 * the heap, update the congestion due to the partially-completed route, put *
 * the whole route so far (excluding IPINs and SINKs) on the heap with cost  *
 * 0., and expand till you hit the next SINK.  That would be slow, so I      *
 * do some hacks to enable incremental wavefront expansion instead.          */

    if (tptr == NULL)
       return;         /* No route yet */

    next_ptr = tptr->next;
    last_ipin_node = OPEN;  /* Stops compiler from complaining. */

/* Can't put last SINK on heap with NO_PREVIOUS, etc, since that won't let  *
 * us reach it again.  Instead, leave the last traceback element (SINK) off *
 * the heap.                                                                */

    while (next_ptr != NULL) {         
       inode = tptr->index;
       node_to_heap (inode, 0., NO_PREVIOUS, NO_PREVIOUS);

       if (rr_node[inode].type == IPIN)
          last_ipin_node = inode;

       tptr = next_ptr;
       next_ptr = tptr->next;
    }

/* This will stop the IPIN node used to get to this SINK from being         *
 * reexpanded for the remainder of this net's routing.  This will make us   *
 * hook up more IPINs to this SINK (which is what we want).  If IPIN        *
 * doglegs are allowed in the graph, we won't be able to use this IPIN to   *
 * do a dogleg, since it won't be re-expanded.  Shouldn't be a big problem. */

    rr_node_route_inf[last_ipin_node].path_cost = - HUGE_FLOAT;

/* Also need to mark the SINK as having high cost, so another connection can *
 * be made to it.                                                            */

    sink_node = tptr->index;
    rr_node_route_inf[sink_node].path_cost = HUGE_FLOAT;

/* Finally, I need to remove any pending connections to this SINK via the    *
 * IPIN I just used (since they would result in congestion).  Scan through   *
 * the heap to do this.                                                      */

    invalidate_heap_entries (sink_node, last_ipin_node);
 }
}


static void invalidate_heap_entries (int sink_node, int ipin_node) {

/* Marks all the heap entries consisting of sink_node, where it was reached *
 * via ipin_node, as invalid (OPEN).                                        */

 int i;

 for (i=1;i<heap_tail;i++) {
    if (heap[i]->index == sink_node && heap[i]->u.prev_node == ipin_node) 
       heap[i]->index = OPEN;    /* Invalid. */
 }
}


static struct s_trace *update_traceback (struct s_heap *hptr, int inet) {

/* This routine adds the most recently finished wire segment to the         *
 * traceback linked list.  The first connection starts with the net SOURCE  *
 * and begins at the structure pointed to by trace_head[inet]. Each         *
 * connection ends with a SINK.  After each SINK, the next connection       *
 * begins (if the net has more than 2 pins).  The first element after the   *
 * SINK gives the routing node on a previous piece of the routing, which is *
 * the link from the existing net to this new piece of the net.             *
 * In each traceback I start at the end of a path and trace back through    *
 * its predecessors to the beginning.  I have stored information on the     *
 * predecesser of each node to make traceback easy -- this sacrificies some *
 * memory for easier code maintenance.  This routine returns a pointer to   *
 * the first "new" node in the traceback (node not previously in trace).    */ 

 struct s_trace *tptr, *prevptr, *temptail, *ret_ptr;
 int inode;
 short iedge;
#ifdef DEBUG
 t_rr_type rr_type;
#endif

 inode = hptr->index;

#ifdef DEBUG
   rr_type = rr_node[inode].type;
   if (rr_type != SINK) {
      printf("Error in update_traceback.  Expected type = SINK (%d).\n",
         IPIN);
      printf("Got type = %d while tracing back net %d.\n", rr_type, inet);
      exit(1);
   }
#endif
 
 tptr = alloc_trace_data ();   /* SINK on the end of the connection */ 
 tptr->index = inode;
 tptr->iswitch = OPEN;
 tptr->next = NULL;
 temptail = tptr;              /* This will become the new tail at the end */
                               /* of the routine.                          */

/* Now do it's predecessor. */

 inode = hptr->u.prev_node;
 iedge = hptr->prev_edge;

 while (inode != NO_PREVIOUS) {
    prevptr = alloc_trace_data();
    prevptr->index = inode;
    prevptr->iswitch = rr_node[inode].switches[iedge];
    prevptr->next = tptr;
    tptr = prevptr;

    iedge = rr_node_route_inf[inode].prev_edge;
    inode = rr_node_route_inf[inode].prev_node;
 }

 if (trace_tail[inet] != NULL) {
    trace_tail[inet]->next = tptr;     /* Traceback ends with tptr */
    ret_ptr = tptr->next;              /* First new segment.       */
 }
 else {                /* This was the first "chunk" of the net's routing */
    trace_head[inet] = tptr;
    ret_ptr = tptr;                    /* Whole traceback is new. */
 }

 trace_tail[inet] = temptail;
 return (ret_ptr);
}


static void reset_path_costs (void) {

/* The routine sets the path_cost to HUGE_FLOAT for all channel segments   *
 * touched by previous routing phases.                                     */

 struct s_linked_f_pointer *mod_ptr;
#ifdef DEBUG
 int num_mod_ptrs;
#endif

/* The traversal method below is slightly painful to make it faster. */

 if (rr_modified_head != NULL) {
    mod_ptr = rr_modified_head;

#ifdef DEBUG 
    num_mod_ptrs = 1;
#endif

    while (mod_ptr->next != NULL) {
       *(mod_ptr->fptr) = HUGE_FLOAT;
       mod_ptr = mod_ptr->next;
#ifdef DEBUG 
       num_mod_ptrs++;
#endif
    }
    *(mod_ptr->fptr) = HUGE_FLOAT;   /* Do last one. */
    
/* Reset the modified list and put all the elements back in the free   *
 * list.                                                               */

    mod_ptr->next = linked_f_pointer_free_head;
    linked_f_pointer_free_head = rr_modified_head; 
    rr_modified_head = NULL;

#ifdef DEBUG 
    num_linked_f_pointer_allocated -= num_mod_ptrs;
#endif
 }
}


static void expand_neighbours (int inode, float pcost, int inet,
          float bend_cost) {

/* Puts all the rr_nodes adjacent to inode on the heap.  rr_nodes outside   *
 * the expanded bounding box specified in route_bb are not added to the     *
 * heap.  pcost is the path_cost to get to inode.                           */

 int iconn, to_node, num_edges;
 t_rr_type from_type, to_type;
 float tot_cost;

 num_edges = rr_node[inode].num_edges;
 for (iconn=0;iconn<num_edges;iconn++) {
    to_node = rr_node[inode].edges[iconn];
    
    if (   rr_node[to_node].xhigh < route_bb[inet].xmin || 
           rr_node[to_node].xlow > route_bb[inet].xmax  ||
           rr_node[to_node].yhigh < route_bb[inet].ymin ||
           rr_node[to_node].ylow > route_bb[inet].ymax    )
       continue;      /* Node is outside (expanded) bounding box. */

    tot_cost = pcost + rr_node_route_inf[to_node].cost;

    if (bend_cost != 0.) {
       from_type = rr_node[inode].type;
       to_type = rr_node[to_node].type;
       if ((from_type == CHANX && to_type == CHANY) ||
              (from_type == CHANY && to_type == CHANX))
          tot_cost += bend_cost;
    }
    
    node_to_heap (to_node, tot_cost, inode, iconn);
 }
}


static void add_source_to_heap (int inet) {

/* Adds the SOURCE of this net to the heap.  Used to start a net's routing. */

 int inode;
 float cost;

 inode = net_rr_terminals[inet][0];   /* SOURCE */
 cost = rr_node_route_inf[inode].cost;

 node_to_heap (inode, cost, NO_PREVIOUS, NO_PREVIOUS);
}


static void mark_ends (int inet) {

/* Mark all the SINKs of this net as targets by setting their target flags  *
 * to the number of times the net must connect to each SINK.  Note that     *
 * this number can occassionally be greater than 1 -- think of connecting   *
 * the same net to two inputs of an and-gate (and-gate inputs are logically *
 * equivalent, so both will connect to the same SINK).                      */

 int ipin, inode;

 for (ipin=1;ipin<net[inet].num_pins;ipin++) {
    inode = net_rr_terminals[inet][ipin];
    rr_node_route_inf[inode].target_flag++;
 }
}


static void node_to_heap (int inode, float cost, int prev_node, int 
         prev_edge) {

/* Puts an rr_node on the heap, if the new cost given is lower than the     *
 * current path_cost to this channel segment.  The index of its predecessor *
 * is stored to make traceback easy.  The index of the edge used to get     *
 * from its predecessor to it is also stored to make timing analysis, etc.  *
 * easy.                                                                    */

 struct s_heap *hptr;

 if (cost >= rr_node_route_inf[inode].path_cost)
     return;

 hptr = alloc_heap_data();
 hptr->index = inode; 
 hptr->cost = cost;
 hptr->u.prev_node = prev_node;
 hptr->prev_edge = prev_edge;
 add_to_heap (hptr);
}


static void free_traceback (int inet) {

/* Puts the entire traceback (old routing) for this net on the free list *
 * and sets the trace_head pointers etc. for the net to NULL.            */

 struct s_trace *tptr, *tempptr;

 tptr = trace_head[inet];

 while (tptr != NULL) {
    tempptr = tptr->next; 
    free_trace_data (tptr);
    tptr = tempptr;
 }
 
 trace_head[inet] = NULL; 
 trace_tail[inet] = NULL;
}


struct s_trace **alloc_route_structs (void) {

/* Allocates the data structures needed for routing.    */

 struct s_trace **best_routing;

 best_routing = (struct s_trace **) my_calloc (num_nets, 
     sizeof (struct s_trace *));

 trace_head = (struct s_trace **) my_calloc (num_nets,  
    sizeof(struct s_trace *));
 trace_tail = (struct s_trace **) my_malloc (num_nets * 
    sizeof(struct s_trace *));

 heap_size = nx*ny;
 heap = (struct s_heap **) my_malloc (heap_size * 
    sizeof (struct s_heap *));
 heap--;   /* heap stores from [1..heap_size] */
 heap_tail = 1;

 route_bb = (struct s_bb *) my_malloc (num_nets * sizeof (struct s_bb));
 
 return (best_routing);
}


void free_route_structs (struct s_trace **best_routing) {

/* Frees the temporary storage needed only during the routing.  The  *
 * final routing result is not freed.                                */

 free ((void *) (heap + 1));
 free ((void *) best_routing);

/* NB:  Should use my chunk_malloc for tptr, hptr, and mod_ptr structures. *
 * I could free everything except the tptrs at the end then.               */
}


static void alloc_and_load_rr_node_route_structs (void) {

/* Allocates some extra information about each rr_node that is used only   *
 * during routing.                                                         */

 int inode;

 if (rr_node_route_inf != NULL) {
    printf ("Error in alloc_and_load_rr_node_route_structs:  \n"
            "old rr_node_route_inf array exists.\n");
    exit (1);
 }

 rr_node_route_inf = my_malloc (num_rr_nodes * sizeof (struct
                           s_rr_node_route_inf));

 for (inode=0;inode<num_rr_nodes;inode++) {
    rr_node_route_inf[inode].prev_node = NO_PREVIOUS;
    rr_node_route_inf[inode].prev_edge = NO_PREVIOUS;
    rr_node_route_inf[inode].cost = rr_node_cost_inf[inode].base_cost;
    rr_node_route_inf[inode].path_cost = HUGE_FLOAT;
    rr_node_route_inf[inode].target_flag = 0;
 }
}


static void free_rr_node_route_structs (void) {

/* Frees the extra information about each rr_node that is needed only      *
 * during routing.                                                         */

 free (rr_node_route_inf);
 rr_node_route_inf = NULL;   /* Mark as free */
}


static void load_route_bb (int bb_factor) {

/* This routine loads the bounding box arrays used to limit the space  *
 * searched by the maze router when routing each net.  The search is   *
 * limited to channels contained with the net bounding box expanded    *
 * by bb_factor channels on each side.  For example, if bb_factor is   *
 * 0, the maze router must route each net within its bounding box.     *
 * If bb_factor = nx, the maze router will search every channel in     *
 * the FPGA if necessary.  The bounding boxes returned by this routine *
 * are different from the ones used by the placer in that they are     * 
 * clipped to lie within (0,0) and (nx+1,ny+1) rather than (1,1) and   *
 * (nx,ny).                                                            */

 int k, xmax, ymax, xmin, ymin, x, y, inet;

 for (inet=0;inet<num_nets;inet++) {
    x = block[net[inet].pins[0]].x;
    y = block[net[inet].pins[0]].y;

    xmin = x;
    ymin = y;
    xmax = x;
    ymax = y;

    for (k=1;k<net[inet].num_pins;k++) {
       x = block[net[inet].pins[k]].x;
       y = block[net[inet].pins[k]].y;

       if (x < xmin) {
          xmin = x;
       }
       else if (x > xmax) {
          xmax = x;
       }

       if (y < ymin) {
          ymin = y;
       }
       else if (y > ymax ) {
          ymax = y;
       }
    }   

   /* Want the channels on all 4 sides to be usuable, even if bb_factor = 0. */

    xmin -= 1;
    ymin -= 1;

   /* Expand the net bounding box by bb_factor, then clip to the physical *
    * chip area.                                                          */

    route_bb[inet].xmin = max (xmin - bb_factor, 0);
    route_bb[inet].xmax = min (xmax + bb_factor, nx+1);
    route_bb[inet].ymin = max (ymin - bb_factor, 0);
    route_bb[inet].ymax = min (ymax + bb_factor, ny+1);
 }
}


static void add_to_mod_list (float *fptr) {

/* This routine adds the floating point pointer (fptr) into a  *
 * linked list that indicates all the pathcosts that have been *
 * modified thus far.                                          */

 struct s_linked_f_pointer *mod_ptr;

 mod_ptr = alloc_linked_f_pointer ();

/* Add this element to the start of the modified list. */

 mod_ptr->next = rr_modified_head;
 mod_ptr->fptr = fptr;
 rr_modified_head = mod_ptr;
}


static void add_to_heap (struct s_heap *hptr) {

/* Adds an item to the heap, expanding the heap if necessary.             */

 int ito, ifrom;
 struct s_heap *temp_ptr;
   
 if (heap_tail > heap_size ) {          /* Heap is full */
    heap_size *= 2;
    heap = my_realloc ((void *)(heap + 1), heap_size * 
       sizeof (struct s_heap *));
    heap--;     /* heap goes from [1..heap_size] */
 }

 heap[heap_tail] = hptr;
 ifrom = heap_tail;
 ito = ifrom/2;
 heap_tail++;

 while ((ito >= 1) && (heap[ifrom]->cost < heap[ito]->cost)) {
    temp_ptr = heap[ito];
    heap[ito] = heap[ifrom];
    heap[ifrom] = temp_ptr;
    ifrom = ito;
    ito = ifrom/2;
 } 
}


static struct s_heap *get_heap_head (void) {

/* Returns a pointer to the smallest element on the heap, or NULL if the     *
 * heap is empty.  Invalid (index == OPEN) entries on the heap are never     *
 * returned -- they are just skipped over.                                   */

 int ito, ifrom;
 struct s_heap *heap_head, *temp_ptr;

 do {
    if (heap_tail == 1) {    /* Empty heap. */
       printf("Empty heap occurred in get_heap_head.\n");
       printf("Some blocks are impossible to connect in this architecture.\n");
       return (NULL);
    }

    heap_head = heap[1];                /* Smallest element. */
 
    /* Now fix up the heap */

    heap_tail--;
    heap[1] = heap[heap_tail];
    ifrom = 1;
    ito = 2*ifrom;
   
    while (ito < heap_tail) {
       if (heap[ito+1]->cost < heap[ito]->cost)
          ito++;
       if (heap[ito]->cost > heap[ifrom]->cost)
          break;
       temp_ptr = heap[ito];
       heap[ito] = heap[ifrom];
       heap[ifrom] = temp_ptr;
       ifrom = ito;
       ito = 2*ifrom;
    } 

 } while (heap_head->index == OPEN);  /* Get another one if invalid entry. */

 return(heap_head);
}


static void empty_heap (void) {

 int i;

 for (i=1;i<heap_tail;i++) 
    free_heap_data (heap[i]);

 heap_tail = 1;
}

#define NCHUNK 200  /* # of various structs malloced at a time. */


static struct s_heap *alloc_heap_data (void) {

 int i;
 struct s_heap *temp_ptr;

 if (heap_free_head == NULL) {   /* No elements on the free list */
    heap_free_head = (struct s_heap *) my_malloc (NCHUNK *
       sizeof(struct s_heap));

/* If I want to free this memory, I have to store the original pointer *
 * somewhere.  Not worthwhile right now -- if you need more memory     *
 * for post-routing stages, look into it.                              */

    for (i=0;i<NCHUNK-1;i++) 
       (heap_free_head + i)->u.next = heap_free_head + i + 1;
    (heap_free_head + NCHUNK - 1)->u.next = NULL;
 }

 temp_ptr = heap_free_head;
 heap_free_head = heap_free_head->u.next;
#ifdef DEBUG
    num_heap_allocated++;
#endif
 return (temp_ptr);
}


static void free_heap_data (struct s_heap *hptr) {

 hptr->u.next = heap_free_head; 
 heap_free_head = hptr;
#ifdef DEBUG
    num_heap_allocated--;
#endif
}


static struct s_trace *alloc_trace_data (void) {

 int i;
 struct s_trace *temp_ptr;
 
 if (trace_free_head == NULL) {   /* No elements on the free list */
    trace_free_head = (struct s_trace *) my_malloc (NCHUNK *
       sizeof(struct s_trace));
 
/* If I want to free this memory, I have to store the original pointer *
 * somewhere.  Not worthwhile right now -- if you need more memory     *
 * for post-routing stages, look into it.                              */
 
    for (i=0;i<NCHUNK-1;i++)
       (trace_free_head + i)->next = trace_free_head + i + 1;
    (trace_free_head + NCHUNK-1)->next = NULL;
 }
 temp_ptr = trace_free_head;
 trace_free_head = trace_free_head->next;
#ifdef DEBUG
    num_trace_allocated++;
#endif
 return (temp_ptr);
}


static void free_trace_data (struct s_trace *tptr) {

/* Puts the traceback structure pointed to by tptr on the free list. */
 
 tptr->next = trace_free_head;
 trace_free_head = tptr;
#ifdef DEBUG
    num_trace_allocated--;
#endif
}


static struct s_linked_f_pointer *alloc_linked_f_pointer (void) {
 
/* This routine returns a linked list element with a float pointer as *
 * the node data.                                                     */
 
 int i;  
 struct s_linked_f_pointer *temp_ptr;
 
 if (linked_f_pointer_free_head == NULL) {
    /* No elements on the free list */
    linked_f_pointer_free_head = (struct s_linked_f_pointer *)
        my_malloc (NCHUNK * sizeof(struct s_linked_f_pointer));
 
/* If I want to free this memory, I have to store the original pointer *
 * somewhere.  Not worthwhile right now -- if you need more memory     * 
 * for post-routing stages, look into it.                              */
 
    for (i=0;i<NCHUNK-1;i++) {
       (linked_f_pointer_free_head + i)->next = linked_f_pointer_free_head
                          + i + 1;
    }
    (linked_f_pointer_free_head + NCHUNK-1)->next = NULL;
 }
 
 temp_ptr = linked_f_pointer_free_head;
 linked_f_pointer_free_head = linked_f_pointer_free_head->next;
 
#ifdef DEBUG     
    num_linked_f_pointer_allocated++;
#endif

 return (temp_ptr);
}


void print_route (char *route_file) {

/* Prints out the routing to file route_file.  */

 int inet, inode, ipin, bnum, ilow, jlow;
 t_rr_type rr_type;
 struct s_trace *tptr;
 char *name_type[] = {"SOURCE", "SINK", "IPIN", "OPIN", "CHANX","CHANY"};
 FILE *fp;

 fp = my_fopen (route_file, "w", 0);

 fprintf (fp, "Array size: %d x %d logic blocks.\n", nx, ny);
 fprintf(fp,"\nRouting:");
 for (inet=0;inet<num_nets;inet++) {
    if (is_global[inet] == 0) {
       fprintf(fp, "\n\nNet %d (%s)\n\n",inet, net[inet].name);
       tptr = trace_head[inet]; 

       while (tptr != NULL) {
          inode = tptr->index;
          rr_type = rr_node[inode].type;
          ilow = rr_node[inode].xlow;
          jlow = rr_node[inode].ylow;
          
          fprintf(fp, "%6s (%d,%d) ", name_type[rr_type], ilow, jlow);

          if ((ilow != rr_node[inode].xhigh) || (jlow != 
                    rr_node[inode].yhigh)) 
             fprintf (fp, "to (%d,%d) ", rr_node[inode].xhigh, 
                  rr_node[inode].yhigh);

          switch (rr_type) {
          
          case IPIN: case OPIN:
             if (clb[ilow][jlow].type == CLB) {
                fprintf (fp, " Pin: ");
             }
             else {   /* IO Pad. */
                fprintf (fp, " Pad: ");
             }
             break;

          case CHANX: case CHANY:
             fprintf (fp, " Track: "); 
             break;

          case SOURCE: case SINK:
             if (clb[ilow][jlow].type == CLB) {
                fprintf (fp, " Class: ");
             }
             else {   /* IO Pad. */
                fprintf (fp, " Pad: ");
             }
             break;

          default:
             printf ("Error in print_route:  Unexpected traceback element "
                     "type: %d (%s).\n", rr_type, name_type[rr_type]);
             exit (1);
             break;
          }

          fprintf(fp, "%d  ", rr_node[inode].ptc_num);

/* Uncomment line below if you're debugging and want to see the switch types *
 * used in the routing.                                                      */
/*          fprintf (fp, "Switch: %d", tptr->iswitch);    */
          
          fprintf (fp, "\n");

          tptr = tptr->next;
       }
    }

    else {    /* Global net.  Never routed. */
       fprintf(fp, "\n\nNet %d (%s): global net connecting:\n\n", inet,
              net[inet].name);
       for (ipin=0;ipin<net[inet].num_pins;ipin++) {
          bnum = net[inet].pins[ipin];
     
          fprintf(fp, "Block %s (#%d) at (%d, %d), Pin class %d.\n",
             block[bnum].name, bnum, block[bnum].x, block[bnum].y, 
             net_pin_class[inet][ipin]);
       }
    }
 }

 fclose (fp);

#ifdef DEBUG
   fp = my_fopen ("mem.echo","w",0);
   fprintf(fp, "\nNum_heap_allocated: %d   Num_trace_allocated: %d\n",
      num_heap_allocated, num_trace_allocated);
   fprintf(fp, "Num_linked_f_pointer_allocated: %d\n", 
      num_linked_f_pointer_allocated);
   fclose (fp);
#endif

}
