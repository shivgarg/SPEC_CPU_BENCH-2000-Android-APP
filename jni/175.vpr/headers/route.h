int try_route (int width_fac, struct s_router_opts router_opts, struct
        s_det_routing_arch det_routing_arch, struct s_segment_inf 
        *segment_inf, t_timing_inf timing_inf);
boolean feasible_routing (void);
struct s_trace **alloc_route_structs (void);
void free_route_structs (struct s_trace **best_routing);
void save_routing (struct s_trace **best_routing);
void restore_routing (struct s_trace **best_routing);
void get_serial_num (void);
void print_route (char *name);
