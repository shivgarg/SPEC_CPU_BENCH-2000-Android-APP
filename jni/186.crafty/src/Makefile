###############################################################################
# SPECtools2000
#   Version 0.3
#   This makefile should NOT be changed other than to customize for a 
#   particular benchmark.  Users may overide variables by placing them
#   in the Makefile.spec file.  Or by using the "runspec" program to 
#   build the Makefile.spec file for them.
###############################################################################
#	BENCHMARK	-- standard definitions for this benchmark

NUMBER    = 186
NAME      = crafty
EXEBASE   = crafty
BENCHLANG = C
SOURCES   = searchr.c search.c repeat.c next.c nextr.c history.c \
	    nexte.c quiesce.c evaluate.c movgen.c make.c unmake.c \
	    lookup.c store.c attacks.c swap.c boolean.c draw.c \
	    utility.c valid.c drawn.c edit.c enprise.c init.c \
	    input.c interupt.c iterate.c main.c option.c output.c \
	    phase.c ponder.c preeval.c root.c setboard.c time.c validate.c
NEED_MATH  = yes

# Include standard template for this suite
-include ../../../../Makefile.defaults
-include ../../../Makefile.defaults
-include ../../Makefile.defaults
-include ../Makefile.defaults

nomakefiles:
	@echo "*** Whoops!  I didn't find a Makefile.defaults file."
	@echo "*** Your distribution is probably corrupt."
	@echo
