#include <stdio.h>
#include "util.h"
#include "pr.h"
#include "ext.h"
#include "segment_stats.h"


/*************** Variables and defines local to this module ****************/

#define LONGLINE 0

static int *chanx_seg_type = NULL;       /* [0..nodes_per_xchan-1] */
static int *chanx_seg_length = NULL;     /* [0..nodes_per_xchan-1] */
static int *chany_seg_type = NULL;       /* [0..nodes_per_xchan-1] */
static int *chany_seg_length = NULL;     /* [0..nodes_per_xchan-1] */

static int max_segment_length;


/******************* Subroutine definitions ********************************/


void save_segment_type_and_length_info (t_seg_details *seg_details_x, int 
      nodes_per_xchan, t_seg_details *seg_details_y, int nodes_per_ychan) {

/* This routine saves the type (index) and segment length for each of the   *
 * tracks in both the x- and y-directed channels.  The rr_graph doesn't     *
 * store the segment type index, so I need to save that information to      *
 * generate statistics on how often each segment type is used in a          *
 * routing.  I could figure out the length of most segments from the xlow   *
 * and xhigh, etc. elements in the rr_graph, but that would give misleading *
 * info for segments that are cut off by the edge of the array (i.e. I want *
 * to count a segment that should have been length 4 but got cut off by     *
 * the array edge at length 2 as a length 4 segment).                       */

 int itrack, length;

/* Free any old saved data, if it exists. */

 if (chanx_seg_type != NULL) {
    free (chanx_seg_type);
    free (chanx_seg_length);
    free (chany_seg_type);
    free (chany_seg_length);
 }

 chanx_seg_type = (int *) my_malloc (nodes_per_xchan * sizeof (int));
 chanx_seg_length = (int *) my_malloc (nodes_per_xchan * sizeof (int));
 chany_seg_type = (int *) my_malloc (nodes_per_ychan * sizeof (int));
 chany_seg_length = (int *) my_malloc (nodes_per_ychan * sizeof (int));

 max_segment_length = 0;

 for (itrack=0;itrack<nodes_per_xchan;itrack++) {
    chanx_seg_type[itrack] = seg_details_x[itrack].index;
    
    if (!seg_details_x[itrack].longline) 
       length = seg_details_x[itrack].length;
    else
       length = LONGLINE;

    chanx_seg_length[itrack] = length;
    max_segment_length = max (max_segment_length, length);
 }
 
 for (itrack=0;itrack<nodes_per_ychan;itrack++) {
    chany_seg_type[itrack] = seg_details_y[itrack].index;

    if (!seg_details_y[itrack].longline) 
       length = seg_details_y[itrack].length;
    else
       length = LONGLINE;

    chany_seg_length[itrack] = length;
    max_segment_length = max (max_segment_length, length);
 }
}


void get_segment_usage_stats (int num_segment) {

/* Computes statistics on the fractional utilization of segments by type    *
 * (index) and by length.  This routine needs a valid rr_graph, a completed *
 * routing, and the type and length of each track must have been previously *
 * saved by a call to save_segment_type_and_length_info.                    */

 int inode, itrack, length, seg_type;
 int *seg_occ_by_length, *seg_cap_by_length;   /* [0..max_segment_length] */
 int *seg_occ_by_type, *seg_cap_by_type;       /* [0..num_segment-1]      */
 float utilization;


 if (chanx_seg_type == NULL) {
    printf ("Error in get_segment_usage_stats:  the segment type and length\n"
            "of each track has not been saved.\n");
    exit (1);
 }

 seg_occ_by_length = (int *) my_calloc ((max_segment_length + 1), 
                              sizeof (int));
 seg_cap_by_length = (int *) my_calloc ((max_segment_length + 1), 
                              sizeof (int));

 seg_occ_by_type = (int *) my_calloc (num_segment, sizeof (int));
 seg_cap_by_type = (int *) my_calloc (num_segment, sizeof (int));


 for (inode=0;inode<num_rr_nodes;inode++) {
    if (rr_node[inode].type == CHANX) {
       itrack = rr_node[inode].ptc_num;
       length = chanx_seg_length[itrack];
       seg_type = chanx_seg_type[itrack];
       
       seg_occ_by_length[length] += rr_node_cost_inf[inode].occ;
       seg_cap_by_length[length] += rr_node_cost_inf[inode].capacity;
       seg_occ_by_type[seg_type] += rr_node_cost_inf[inode].occ;
       seg_cap_by_type[seg_type] += rr_node_cost_inf[inode].capacity;
       
    }
    
    else if (rr_node[inode].type == CHANY) {
       itrack = rr_node[inode].ptc_num;
       length = chany_seg_length[itrack];
       seg_type = chany_seg_type[itrack];
       
       seg_occ_by_length[length] += rr_node_cost_inf[inode].occ;
       seg_cap_by_length[length] += rr_node_cost_inf[inode].capacity;
       seg_occ_by_type[seg_type] += rr_node_cost_inf[inode].occ;
       seg_cap_by_type[seg_type] += rr_node_cost_inf[inode].capacity;
    }
 }

 printf ("\nSegment usage by type (index):\n");
 printf ("Segment type       Fractional utilization\n");
 printf ("------------       ----------------------\n");

 for (seg_type=0;seg_type<num_segment;seg_type++) {
    if (seg_cap_by_type[seg_type] != 0) {
       utilization = (float) seg_occ_by_type[seg_type] / 
                     (float) seg_cap_by_type[seg_type];
       printf ("%8d                  %5.3g\n", seg_type, utilization);
    }
 }


 printf ("\nSegment usage by length:\n");
 printf ("Segment length       Fractional utilization\n");
 printf ("--------------       ----------------------\n");


 for (length=1;length<=max_segment_length;length++) {
    if (seg_cap_by_length[length] != 0) {
       utilization = (float) seg_occ_by_length[length] / 
                     (float) seg_cap_by_length[length];
       printf ("%9d                   %5.3g\n", length, utilization);
    }
 }

 if (seg_cap_by_length[LONGLINE] != 0) {
    utilization = (float) seg_occ_by_length[LONGLINE] / 
                        (float) seg_cap_by_length[LONGLINE];
       printf ("   longline                 %5.3g\n", utilization);
 }

 
 free (seg_occ_by_length);
 free (seg_cap_by_length);
 free (seg_occ_by_type);
 free (seg_cap_by_type);
}
