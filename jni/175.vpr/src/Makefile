###############################################################################
# SPECtools2000
#   Version 0.3
#   This makefile should NOT be changed other than to customize for a 
#   particular benchmark.  Users may overide variables by placing them
#   in the Makefile.spec file.  Or by using the "runspec" program to 
#   build the Makefile.spec file for them.
###############################################################################
#	BENCHMARK	-- standard definitions for this benchmark

NUMBER    = 172
NAME      = vpr
EXEBASE   = vpr
BENCHLANG = C
SOURCES   = main.c util.c read_netlist.c read_arch.c place.c route.c \
	    stats.c segment_stats.c rr_graph.c \
	    rr_graph2.c rr_graph_sbox.c rr_graph_util.c \
	    rr_graph_timing_params.c rr_graph_area.c check_rr_graph.c \
	    check_route.c hash.c read_place.c
NEED_MATH=yes

# Include standard template for this suite
-include ../../../../Makefile.defaults
-include ../../../Makefile.defaults
-include ../../Makefile.defaults
-include ../Makefile.defaults

nomakefiles:
	@echo "*** Whoops!  I didn't find a Makefile.defaults file."
	@echo "*** Your distribution is probably corrupt."
	@echo
