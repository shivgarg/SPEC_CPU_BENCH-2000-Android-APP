#include "util.h"
#include "pr.h"
#include "ext.h"
#include "rr_graph.h"
#include "rr_graph_util.h"
#include "rr_graph2.h"
#include "rr_graph_timing_params.h"



/****************** Subroutine definitions *********************************/


void add_rr_graph_C_from_switches (float ipin_cblock_C) {

/* This routine finishes loading the C elements of the rr_graph. It assumes *
 * that when you call it the CHANX and CHANY nodes have had their C set to  *
 * their metal capacitance, and everything else has C set to 0.  The graph  *
 * connectivity (edges, switch types etc.) must all be loaded too.  This    *
 * routine will add in the capacitance on the CHANX and CHANY nodes due to: *
 *                                                                          *
 * 1) The output capacitance of the switches coming from OPINs;             *
 * 2) The input and output capacitance of the switches between the various  *
 *    wiring (CHANX and CHANY) segments; and                                *
 * 3) The input capacitance of the buffers separating routing tracks from   *
 *    the connection block inputs.                                          */


 int inode, iedge, switch_index, to_node, maxlen;
 int icblock, itrack;
 float Cin, Cout;
 t_rr_type from_rr_type, to_rr_type;
 boolean *cblock_counted;  /* [0..max(nx,ny)] -- 0th element unused. */
 boolean buffered;


 maxlen = max (nx, ny) + 1;
 cblock_counted = (boolean *) my_calloc (maxlen, sizeof (boolean));

 for (inode=0;inode<num_rr_nodes;inode++) {

    from_rr_type = rr_node[inode].type; 

    if (from_rr_type == CHANX || from_rr_type == CHANY) {
 
      /* I use the code below for speed.  Are all edges from other wires to *
       * this segment buffers or pass transistors?                          */

       itrack = rr_node[inode].ptc_num;

       for (iedge=0;iedge<rr_node[inode].num_edges;iedge++) {

          to_node = rr_node[inode].edges[iedge];
          to_rr_type = rr_node[to_node].type;

          if (to_rr_type == CHANX || to_rr_type == CHANY) {

             switch_index = rr_node[inode].switches[iedge];
             Cin = switch_inf[switch_index].Cin;
             Cout = switch_inf[switch_index].Cout;
             buffered = switch_inf[switch_index].buffered;

            /* If both the switch from inode to to_node and the switch from *
             * to_node back to inode use bidirectional switches (i.e. pass  *
             * transistors), there will only be one physical switch for     *
             * both edges.  Hence, I only want to count the capacitance of  *
             * that switch for one of the two edges.  (Note:  if there is   *
             * a pass transistor edge from x to y, I always build the graph *
             * so that there is a corresponding edge using the same switch  *
             * type from y to x.) So, I arbitrarily choose to add in the    *
             * capacitance in that case of a pass transistor only when      *
             * processing the the lower inode number.                       *
             * If an edge uses a buffer I always have to add in the         *
             * capacitance.                                                 */

             if (buffered || inode < to_node) {
                rr_node[inode].C += Cin;
                rr_node[to_node].C += Cout;
             }

          }  /* End edge to CHANX or CHANY node. */

          else if (to_rr_type == IPIN) {

            /* Code below implements sharing of the track to connection     *
             * box buffer.  I assume there is one such buffer at every      *
             * segment of the wire at which at least one logic block input  *
             * connects.                                                    */

             icblock = seg_index_of_cblock (from_rr_type, to_node);
             if (cblock_counted[icblock] == FALSE) {
                rr_node[inode].C += ipin_cblock_C;
                cblock_counted[icblock] = TRUE;
             }
          }
       }  /* End loop over all edges of a node. */

      /* Reset the cblock_counted array. */

       for (iedge=0;iedge<rr_node[inode].num_edges;iedge++) {
          to_node = rr_node[inode].edges[iedge];
          if (rr_node[to_node].type == IPIN) {
             icblock = seg_index_of_cblock (from_rr_type, to_node);
             cblock_counted[icblock] = FALSE;
          }
       }

    }  /* End node is CHANX or CHANY */

    else if (from_rr_type == OPIN) {

       for (iedge=0;iedge<rr_node[inode].num_edges;iedge++) {
          switch_index = rr_node[inode].switches[iedge];
          Cout = switch_inf[switch_index].Cout;
          to_node = rr_node[inode].edges[iedge];  /* Will be CHANX or CHANY */
          rr_node[to_node].C += Cout;
       }
    }  /* End node is OPIN. */

 }  /* End for all nodes. */

 free (cblock_counted);
}
