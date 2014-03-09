#define MAX_CHANNEL_WIDTH 8000
/* Want to avoid overflows of shorts.  OPINs can have edges to 4 * width if  *
 * they are on all 4 sides.                                                  */

void place_and_route (int operation, struct s_placer_opts 
   placer_opts, char *place_file, char *net_file, char *arch_file, 
   char *route_file, boolean full_stats, boolean verify_binary_search, 
   struct s_annealing_sched annealing_sched, struct s_router_opts router_opts, 
   struct s_det_routing_arch det_routing_arch, struct s_segment_inf 
   *segment_inf, t_timing_inf timing_inf);
void init_chan(int cfactor);
void get_non_updateable_bb (int inet, struct s_bb *bb_coord_new);
