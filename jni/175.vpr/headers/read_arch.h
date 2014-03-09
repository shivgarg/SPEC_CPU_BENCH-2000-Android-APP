void read_arch (char *arch_file, enum e_route_type route_type,
       struct s_det_routing_arch *det_routing_arch, struct s_segment_inf
       **segment_inf_ptr, t_timing_inf *timing_inf_ptr); 
void init_arch (float aspect_ratio, boolean user_sized);
void print_arch (char *arch_file, enum e_route_type route_type,
       struct s_det_routing_arch det_routing_arch, struct s_segment_inf
       *segment_inf, t_timing_inf timing_inf); 
