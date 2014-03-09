###############################################################################
# SPECtools2000
#   Version 0.3
#   This makefile should NOT be changed other than to customize for a 
#   particular benchmark.  Users may overide variables by placing them
#   in the Makefile.spec file.  Or by using the "runspec" program to 
#   build the Makefile.spec file for them.
###############################################################################
#	BENCHMARK	-- standard definitions for this benchmark

NUMBER    = 176
NAME      = gcc
EXEBASE   = cc1
BENCHLANG = C
SOURCES   = c-parse.c c-lang.c c-lex.c c-pragma.c c-decl.c \
	    c-typeck.c c-convert.c c-aux-info.c c-common.c \
	    c-iterate.c toplev.c version.c tree.c print-tree.c \
	    stor-layout.c fold-const.c function.c stmt.c expr.c \
	    calls.c expmed.c explow.c optabs.c varasm.c rtl.c \
	    print-rtl.c rtlanal.c emit-rtl.c real.c dbxout.c \
	    sdbout.c dwarfout.c xcoffout.c integrate.c jump.c cse.c \
	    loop.c unroll.c flow.c stupid.c combine.c regclass.c \
	    local-alloc.c global.c reload.c reload1.c caller-save.c \
	    insn-peep.c reorg.c sched.c final.c recog.c reg-stack.c \
	    insn-opinit.c insn-recog.c insn-extract.c insn-output.c \
	    insn-emit.c insn-attrtab.c m88k.c getpwd.c convert.c \
	    bc-emit.c bc-optab.c obstack.c
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
