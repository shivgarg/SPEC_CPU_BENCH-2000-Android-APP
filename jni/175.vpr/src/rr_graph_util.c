#include "util.h"
#include "pr.h"
#include "ext.h"
#include "rr_graph_util.h"




t_linked_edge *insert_in_edge_list (t_linked_edge *head, int edge, short 
      iswitch, t_linked_edge **free_list_head_ptr) {
 
/* Inserts a new element at the head of a linked list.  Returns the new head *
 * of the list.  One argument is the address of the head of a list of free   *
 * edge_list elements.  If there are any elements on this free list, the new *
 * element is taken from it.  Otherwise a new one is malloced.               */
 
 t_linked_edge *linked_edge;
 
 if (*free_list_head_ptr != NULL) {
    linked_edge = *free_list_head_ptr;
    *free_list_head_ptr = linked_edge->next;
 }
 else {
    linked_edge = (t_linked_edge *) my_malloc (sizeof (t_linked_edge));
 }
 
 linked_edge->edge = edge;
 linked_edge->iswitch = iswitch;
 linked_edge->next = head;
 return (linked_edge);
}
 
 
void free_edge_list_hard (t_linked_edge **edge_list_head_ptr) {
 
/* This routine truly frees (calls free) all the edge list elements       *
 * on the linked list pointed to by *head, and sets head = NULL.          */
 
 t_linked_edge *linked_edge, *next_linked_edge;
 
 linked_edge = *edge_list_head_ptr;
 
 while (linked_edge != NULL) {
    next_linked_edge = linked_edge->next;
    free (linked_edge);
    linked_edge = next_linked_edge;
 }
 
 *edge_list_head_ptr = NULL;
}


void free_linked_edge_soft (t_linked_edge *edge_ptr, t_linked_edge 
      **free_list_head_ptr) {

/* This routine does a soft free of the structure pointed to by edge_ptr by *
 * adding it to the free list.  You have to pass in the address of the      *
 * head of the free list.                                                   */

 edge_ptr->next = *free_list_head_ptr;
 *free_list_head_ptr = edge_ptr;
}


int seg_index_of_cblock (t_rr_type from_rr_type, int to_node) {

/* Returns the segment number (distance along the channel) of the connection *
 * box from from_rr_type (CHANX or CHANY) to to_node (IPIN).                 */

 if (from_rr_type == CHANX)
    return (rr_node[to_node].xlow);
 else                                /* CHANY */
    return (rr_node[to_node].ylow);
}


int seg_index_of_sblock (int from_node, int to_node) {

/* Returns the segment number (distance along the channel) of the switch box *
 * box from from_node (CHANX or CHANY) to to_node (CHANX or CHANY).  The     *
 * switch box on the left side of a CHANX segment at (i,j) has seg_index =   *
 * i-1, while the switch box on the right side of that segment has seg_index *
 * = i.  CHANY stuff works similarly.  Hence the range of values returned is *
 * 0 to nx (if from_node is a CHANX) or 0 to ny (if from_node is a CHANY).   */

 t_rr_type from_rr_type, to_rr_type;

 from_rr_type = rr_node[from_node].type;
 to_rr_type = rr_node[to_node].type;

 if (from_rr_type == CHANX) {
    if (to_rr_type == CHANY) {
       return (rr_node[to_node].xlow);
    }
    else if (to_rr_type == CHANX) {
       if (rr_node[to_node].xlow > rr_node[from_node].xlow) { /* Going right */
          return (rr_node[from_node].xhigh);
       }
       else {   /* Going left */
          return (rr_node[to_node].xhigh);
       }
    }
    else {
       printf ("Error in seg_index_of_sblock:  to_node %d is of type %d.\n",
               to_node, to_rr_type);
       exit (1);
    }
 }    /* End from_rr_type is CHANX */

 else if (from_rr_type == CHANY) {
    if (to_rr_type == CHANX) { 
       return (rr_node[to_node].ylow); 
    }
    else if (to_rr_type == CHANY) {
       if (rr_node[to_node].ylow > rr_node[from_node].ylow) { /* Going up */
          return (rr_node[from_node].yhigh); 
       } 
       else {   /* Going down */
          return (rr_node[to_node].yhigh);
       } 
    } 
    else { 
       printf ("Error in seg_index_of_sblock:  to_node %d is of type %d.\n", 
               to_node, to_rr_type);
       exit (1); 
    }
 }    /* End from_rr_type is CHANY */

 else {
    printf ("Error in seg_index_of_sblock:  from_node %d is of type %d.\n", 
            from_node, from_rr_type);
    exit (1); 
 }
}
