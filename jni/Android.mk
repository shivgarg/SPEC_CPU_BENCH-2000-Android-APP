# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE := assetbridge
LOCAL_SRC_FILES := assetbridge/assetbridge.c
include $(BUILD_SHARED_LIBRARY)
#########################################################################

include $(CLEAR_VARS)
LOCAL_MODULE    := gzip
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/164.gzip/headers	
LOCAL_SRC_FILES := 164.gzip/src/getopt.c 164.gzip/src/gzip.c 164.gzip/src/lzw.c 164.gzip/src/spec.c 164.gzip/src/bits.c 164.gzip/src/deflate.c 164.gzip/src/inflate.c 164.gzip/src/trees.c 164.gzip/src/unlzh.c 164.gzip/src/unlzw.c 164.gzip/src/unpack.c 164.gzip/src/unzip.c 164.gzip/src/util.c 164.gzip/src/zip.c
include $(BUILD_SHARED_LIBRARY)
#########################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := gzipO1
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/164.gzip/headers	
LOCAL_SRC_FILES := 164.gzip/src/getopt.c 164.gzip/src/gzip.c 164.gzip/src/lzw.c 164.gzip/src/specO1.c 164.gzip/src/bits.c 164.gzip/src/deflate.c 164.gzip/src/inflate.c 164.gzip/src/trees.c 164.gzip/src/unlzh.c 164.gzip/src/unlzw.c 164.gzip/src/unpack.c 164.gzip/src/unzip.c 164.gzip/src/util.c 164.gzip/src/zip.c
LOCAL_CFLAGS	:=-O1
include $(BUILD_SHARED_LIBRARY)
#########################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := gzipO2
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/164.gzip/headers	
LOCAL_SRC_FILES := 164.gzip/src/getopt.c 164.gzip/src/gzip.c 164.gzip/src/lzw.c 164.gzip/src/specO2.c 164.gzip/src/bits.c 164.gzip/src/deflate.c 164.gzip/src/inflate.c 164.gzip/src/trees.c 164.gzip/src/unlzh.c 164.gzip/src/unlzw.c 164.gzip/src/unpack.c 164.gzip/src/unzip.c 164.gzip/src/util.c 164.gzip/src/zip.c
LOCAL_CFLAGS	:=-O2
include $(BUILD_SHARED_LIBRARY)
#########################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := gzipO3
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/164.gzip/headers	
LOCAL_SRC_FILES := 164.gzip/src/getopt.c 164.gzip/src/gzip.c 164.gzip/src/lzw.c 164.gzip/src/specO3.c 164.gzip/src/bits.c 164.gzip/src/deflate.c 164.gzip/src/inflate.c 164.gzip/src/trees.c 164.gzip/src/unlzh.c 164.gzip/src/unlzw.c 164.gzip/src/unpack.c 164.gzip/src/unzip.c 164.gzip/src/util.c 164.gzip/src/zip.c
LOCAL_CFLAGS	:=-O3
include $(BUILD_SHARED_LIBRARY)
#########################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := gzipO3F
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/164.gzip/headers	
LOCAL_SRC_FILES := 164.gzip/src/getopt.c 164.gzip/src/gzip.c 164.gzip/src/lzw.c 164.gzip/src/specO3F.c 164.gzip/src/bits.c 164.gzip/src/deflate.c 164.gzip/src/inflate.c 164.gzip/src/trees.c 164.gzip/src/unlzh.c 164.gzip/src/unlzw.c 164.gzip/src/unpack.c 164.gzip/src/unzip.c 164.gzip/src/util.c 164.gzip/src/zip.c
LOCAL_CFLAGS	:=-Ofast
include $(BUILD_SHARED_LIBRARY)
#########################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := bzip2
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/256.bzip2/headers	
LOCAL_SRC_FILES := 256.bzip2/src/bzip2.c 256.bzip2/src/spec.c 
include $(BUILD_SHARED_LIBRARY)
#########################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := bzip2O1
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/256.bzip2/headers	
LOCAL_SRC_FILES := 256.bzip2/src/bzip2.c 256.bzip2/src/specO1.c 
LOCAL_CFLAGS	:=-O1
include $(BUILD_SHARED_LIBRARY)
#########################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := bzip2O2
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/256.bzip2/headers	
LOCAL_SRC_FILES := 256.bzip2/src/bzip2.c 256.bzip2/src/specO2.c 
LOCAL_CFLAGS	:=-O2
include $(BUILD_SHARED_LIBRARY)
#########################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := bzip2O3
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/256.bzip2/headers	
LOCAL_SRC_FILES := 256.bzip2/src/bzip2.c 256.bzip2/src/specO3.c 
LOCAL_CFLAGS	:=-O3
include $(BUILD_SHARED_LIBRARY)
#########################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := bzip2O3F
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/256.bzip2/headers	
LOCAL_SRC_FILES := 256.bzip2/src/bzip2.c 256.bzip2/src/specO3F.c 
LOCAL_CFLAGS	:=-Ofast
include $(BUILD_SHARED_LIBRARY)
#########################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := mcf
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/181.mcf/headers	
LOCAL_SRC_FILES := 181.mcf/src/implicit.c 181.mcf/src/mcf.c 181.mcf/src/mcfutil.c 181.mcf/src/output.c 181.mcf/src/pbeampp.c 181.mcf/src/pbla.c 181.mcf/src/pflowup.c 181.mcf/src/psimplex.c 181.mcf/src/pstart.c 181.mcf/src/readmin.c 181.mcf/src/treeup.c 
LOCAL_LDLIBS	:=-lm
include $(BUILD_SHARED_LIBRARY)
##############################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := mcfO1
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/181.mcf/headers	
LOCAL_SRC_FILES := 181.mcf/src/implicit.c 181.mcf/src/mcfO1.c 181.mcf/src/mcfutil.c 181.mcf/src/output.c 181.mcf/src/pbeampp.c 181.mcf/src/pbla.c 181.mcf/src/pflowup.c 181.mcf/src/psimplex.c 181.mcf/src/pstart.c 181.mcf/src/readmin.c 181.mcf/src/treeup.c 
LOCAL_LDLIBS	:=-lm
LOCAL_CFLAGS	:=-O1
include $(BUILD_SHARED_LIBRARY)
###############################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := mcfO2
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/181.mcf/headers	
LOCAL_SRC_FILES := 181.mcf/src/implicit.c 181.mcf/src/mcfO2.c 181.mcf/src/mcfutil.c 181.mcf/src/output.c 181.mcf/src/pbeampp.c 181.mcf/src/pbla.c 181.mcf/src/pflowup.c 181.mcf/src/psimplex.c 181.mcf/src/pstart.c 181.mcf/src/readmin.c 181.mcf/src/treeup.c 
LOCAL_LDLIBS	:=-lm
LOCAL_CFALGS	:=-O2
include $(BUILD_SHARED_LIBRARY)
################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := mcfO3
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/181.mcf/headers	
LOCAL_SRC_FILES := 181.mcf/src/implicit.c 181.mcf/src/mcfO3.c 181.mcf/src/mcfutil.c 181.mcf/src/output.c 181.mcf/src/pbeampp.c 181.mcf/src/pbla.c 181.mcf/src/pflowup.c 181.mcf/src/psimplex.c 181.mcf/src/pstart.c 181.mcf/src/readmin.c 181.mcf/src/treeup.c 
LOCAL_LDLIBS	:=-lm
LOCAL_CFLAGS	:=-O3
include $(BUILD_SHARED_LIBRARY)
#################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := mcfO3F
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/181.mcf/headers	
LOCAL_SRC_FILES := 181.mcf/src/implicit.c 181.mcf/src/mcfO3F.c 181.mcf/src/mcfutil.c 181.mcf/src/output.c 181.mcf/src/pbeampp.c 181.mcf/src/pbla.c 181.mcf/src/pflowup.c 181.mcf/src/psimplex.c 181.mcf/src/pstart.c 181.mcf/src/readmin.c 181.mcf/src/treeup.c 
LOCAL_LDLIBS	:=-lm
LOCAL_CFLAGS	:=-Ofast
include $(BUILD_SHARED_LIBRARY)
##################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := parser
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/197.parser/headers	
LOCAL_SRC_FILES := 197.parser/src/analyze-linkage.c 197.parser/src/and.c 197.parser/src/build-disjuncts.c 197.parser/src/extract-links.c 197.parser/src/fast-match.c 197.parser/src/idiom.c 197.parser/src/main.c 197.parser/src/massage.c 197.parser/src/parse.c 197.parser/src/post-process.c 197.parser/src/print.c 197.parser/src/prune.c 197.parser/src/read-dict.c 197.parser/src/utilities.c 197.parser/src/xalloc.c 197.parser/src/word-file.c 197.parser/src/strncasecmp.c 
include $(BUILD_SHARED_LIBRARY)
###############################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := parserO1
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/197.parser/headers	
LOCAL_SRC_FILES := 197.parser/src/analyze-linkage.c 197.parser/src/and.c 197.parser/src/build-disjuncts.c 197.parser/src/extract-links.c 197.parser/src/fast-match.c 197.parser/src/idiom.c 197.parser/src/mainO1.c 197.parser/src/massage.c 197.parser/src/parse.c 197.parser/src/post-process.c 197.parser/src/print.c 197.parser/src/prune.c 197.parser/src/read-dict.c 197.parser/src/utilities.c 197.parser/src/xalloc.c 197.parser/src/word-file.c 197.parser/src/strncasecmp.c 
LOCAL_CFLAGS    :=-O1
include $(BUILD_SHARED_LIBRARY)
###############################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := parserO2
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/197.parser/headers	
LOCAL_SRC_FILES := 197.parser/src/analyze-linkage.c 197.parser/src/and.c 197.parser/src/build-disjuncts.c 197.parser/src/extract-links.c 197.parser/src/fast-match.c 197.parser/src/idiom.c 197.parser/src/mainO2.c 197.parser/src/massage.c 197.parser/src/parse.c 197.parser/src/post-process.c 197.parser/src/print.c 197.parser/src/prune.c 197.parser/src/read-dict.c 197.parser/src/utilities.c 197.parser/src/xalloc.c 197.parser/src/word-file.c 197.parser/src/strncasecmp.c 
LOCAL_CFLAGS    :=-O2
include $(BUILD_SHARED_LIBRARY)
###############################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := parserO3
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/197.parser/headers	
LOCAL_SRC_FILES := 197.parser/src/analyze-linkage.c 197.parser/src/and.c 197.parser/src/build-disjuncts.c 197.parser/src/extract-links.c 197.parser/src/fast-match.c 197.parser/src/idiom.c 197.parser/src/mainO3.c 197.parser/src/massage.c 197.parser/src/parse.c 197.parser/src/post-process.c 197.parser/src/print.c 197.parser/src/prune.c 197.parser/src/read-dict.c 197.parser/src/utilities.c 197.parser/src/xalloc.c 197.parser/src/word-file.c 197.parser/src/strncasecmp.c 
LOCAL_CFLAGS    :=-O3
include $(BUILD_SHARED_LIBRARY)
###############################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := parserO3F
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/197.parser/headers	
LOCAL_SRC_FILES := 197.parser/src/analyze-linkage.c 197.parser/src/and.c 197.parser/src/build-disjuncts.c 197.parser/src/extract-links.c 197.parser/src/fast-match.c 197.parser/src/idiom.c 197.parser/src/mainO3F.c 197.parser/src/massage.c 197.parser/src/parse.c 197.parser/src/post-process.c 197.parser/src/print.c 197.parser/src/prune.c 197.parser/src/read-dict.c 197.parser/src/utilities.c 197.parser/src/xalloc.c 197.parser/src/word-file.c 197.parser/src/strncasecmp.c 
LOCAL_CFLAGS    :=-Ofast
include $(BUILD_SHARED_LIBRARY)
###############################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := gcc
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/176.gcc/headers
LOCAL_SRC_FILES := 176.gcc/src/toplev.c 176.gcc/src/c-parse.c 176.gcc/src/c-lang.c 176.gcc/src/c-lex.c 176.gcc/src/c-pragma.c 176.gcc/src/c-decl.c 176.gcc/src/c-typeck.c 176.gcc/src/c-convert.c 176.gcc/src/c-aux-info.c 176.gcc/src/c-common.c 176.gcc/src/c-iterate.c 176.gcc/src/version.c 176.gcc/src/tree.c 176.gcc/src/print-tree.c 176.gcc/src/stor-layout.c 176.gcc/src/fold-const.c 176.gcc/src/function.c 176.gcc/src/stmt.c 176.gcc/src/expr.c 176.gcc/src/calls.c 176.gcc/src/expmed.c 176.gcc/src/explow.c 176.gcc/src/optabs.c 176.gcc/src/varasm.c 176.gcc/src/rtl.c 176.gcc/src/print-rtl.c 176.gcc/src/rtlanal.c 176.gcc/src/emit-rtl.c 176.gcc/src/real.c 176.gcc/src/dbxout.c 176.gcc/src/sdbout.c 176.gcc/src/dwarfout.c 176.gcc/src/xcoffout.c 176.gcc/src/integrate.c 176.gcc/src/jump.c 176.gcc/src/cse.c 176.gcc/src/loop.c 176.gcc/src/unroll.c 176.gcc/src/flow.c 176.gcc/src/stupid.c 176.gcc/src/combine.c 176.gcc/src/regclass.c 176.gcc/src/local-alloc.c 176.gcc/src/global.c 176.gcc/src/reload.c 176.gcc/src/reload1.c 176.gcc/src/caller-save.c 176.gcc/src/insn-peep.c 176.gcc/src/reorg.c 176.gcc/src/sched.c 176.gcc/src/final.c 176.gcc/src/recog.c 176.gcc/src/reg-stack.c 176.gcc/src/insn-opinit.c 176.gcc/src/insn-recog.c 176.gcc/src/insn-extract.c 176.gcc/src/insn-output.c 176.gcc/src/insn-emit.c 176.gcc/src/insn-attrtab.c 176.gcc/src/m88k.c 176.gcc/src/getpwd.c 176.gcc/src/convert.c 176.gcc/src/bc-emit.c 176.gcc/src/bc-optab.c 176.gcc/src/obstack.c 
LOCAL_LDLIBS    := -lm -llog -ljnigraphics

include $(BUILD_SHARED_LIBRARY)
#################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := gccO1
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/176.gcc/headers
LOCAL_SRC_FILES := 176.gcc/src/toplevO1.c 176.gcc/src/c-parse.c 176.gcc/src/c-lang.c 176.gcc/src/c-lex.c 176.gcc/src/c-pragma.c 176.gcc/src/c-decl.c 176.gcc/src/c-typeck.c 176.gcc/src/c-convert.c 176.gcc/src/c-aux-info.c 176.gcc/src/c-common.c 176.gcc/src/c-iterate.c 176.gcc/src/version.c 176.gcc/src/tree.c 176.gcc/src/print-tree.c 176.gcc/src/stor-layout.c 176.gcc/src/fold-const.c 176.gcc/src/function.c 176.gcc/src/stmt.c 176.gcc/src/expr.c 176.gcc/src/calls.c 176.gcc/src/expmed.c 176.gcc/src/explow.c 176.gcc/src/optabs.c 176.gcc/src/varasm.c 176.gcc/src/rtl.c 176.gcc/src/print-rtl.c 176.gcc/src/rtlanal.c 176.gcc/src/emit-rtl.c 176.gcc/src/real.c 176.gcc/src/dbxout.c 176.gcc/src/sdbout.c 176.gcc/src/dwarfout.c 176.gcc/src/xcoffout.c 176.gcc/src/integrate.c 176.gcc/src/jump.c 176.gcc/src/cse.c 176.gcc/src/loop.c 176.gcc/src/unroll.c 176.gcc/src/flow.c 176.gcc/src/stupid.c 176.gcc/src/combine.c 176.gcc/src/regclass.c 176.gcc/src/local-alloc.c 176.gcc/src/global.c 176.gcc/src/reload.c 176.gcc/src/reload1.c 176.gcc/src/caller-save.c 176.gcc/src/insn-peep.c 176.gcc/src/reorg.c 176.gcc/src/sched.c 176.gcc/src/final.c 176.gcc/src/recog.c 176.gcc/src/reg-stack.c 176.gcc/src/insn-opinit.c 176.gcc/src/insn-recog.c 176.gcc/src/insn-extract.c 176.gcc/src/insn-output.c 176.gcc/src/insn-emit.c 176.gcc/src/insn-attrtab.c 176.gcc/src/m88k.c 176.gcc/src/getpwd.c 176.gcc/src/convert.c 176.gcc/src/bc-emit.c 176.gcc/src/bc-optab.c 176.gcc/src/obstack.c 
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:= -O1
include $(BUILD_SHARED_LIBRARY)
#################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := gccO2
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/176.gcc/headers
LOCAL_SRC_FILES := 176.gcc/src/toplevO2.c 176.gcc/src/c-parse.c 176.gcc/src/c-lang.c 176.gcc/src/c-lex.c 176.gcc/src/c-pragma.c 176.gcc/src/c-decl.c 176.gcc/src/c-typeck.c 176.gcc/src/c-convert.c 176.gcc/src/c-aux-info.c 176.gcc/src/c-common.c 176.gcc/src/c-iterate.c 176.gcc/src/version.c 176.gcc/src/tree.c 176.gcc/src/print-tree.c 176.gcc/src/stor-layout.c 176.gcc/src/fold-const.c 176.gcc/src/function.c 176.gcc/src/stmt.c 176.gcc/src/expr.c 176.gcc/src/calls.c 176.gcc/src/expmed.c 176.gcc/src/explow.c 176.gcc/src/optabs.c 176.gcc/src/varasm.c 176.gcc/src/rtl.c 176.gcc/src/print-rtl.c 176.gcc/src/rtlanal.c 176.gcc/src/emit-rtl.c 176.gcc/src/real.c 176.gcc/src/dbxout.c 176.gcc/src/sdbout.c 176.gcc/src/dwarfout.c 176.gcc/src/xcoffout.c 176.gcc/src/integrate.c 176.gcc/src/jump.c 176.gcc/src/cse.c 176.gcc/src/loop.c 176.gcc/src/unroll.c 176.gcc/src/flow.c 176.gcc/src/stupid.c 176.gcc/src/combine.c 176.gcc/src/regclass.c 176.gcc/src/local-alloc.c 176.gcc/src/global.c 176.gcc/src/reload.c 176.gcc/src/reload1.c 176.gcc/src/caller-save.c 176.gcc/src/insn-peep.c 176.gcc/src/reorg.c 176.gcc/src/sched.c 176.gcc/src/final.c 176.gcc/src/recog.c 176.gcc/src/reg-stack.c 176.gcc/src/insn-opinit.c 176.gcc/src/insn-recog.c 176.gcc/src/insn-extract.c 176.gcc/src/insn-output.c 176.gcc/src/insn-emit.c 176.gcc/src/insn-attrtab.c 176.gcc/src/m88k.c 176.gcc/src/getpwd.c 176.gcc/src/convert.c 176.gcc/src/bc-emit.c 176.gcc/src/bc-optab.c 176.gcc/src/obstack.c 
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:=-O2
include $(BUILD_SHARED_LIBRARY)
#################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := gccO3
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/176.gcc/headers
LOCAL_SRC_FILES := 176.gcc/src/toplevO3.c 176.gcc/src/c-parse.c 176.gcc/src/c-lang.c 176.gcc/src/c-lex.c 176.gcc/src/c-pragma.c 176.gcc/src/c-decl.c 176.gcc/src/c-typeck.c 176.gcc/src/c-convert.c 176.gcc/src/c-aux-info.c 176.gcc/src/c-common.c 176.gcc/src/c-iterate.c 176.gcc/src/version.c 176.gcc/src/tree.c 176.gcc/src/print-tree.c 176.gcc/src/stor-layout.c 176.gcc/src/fold-const.c 176.gcc/src/function.c 176.gcc/src/stmt.c 176.gcc/src/expr.c 176.gcc/src/calls.c 176.gcc/src/expmed.c 176.gcc/src/explow.c 176.gcc/src/optabs.c 176.gcc/src/varasm.c 176.gcc/src/rtl.c 176.gcc/src/print-rtl.c 176.gcc/src/rtlanal.c 176.gcc/src/emit-rtl.c 176.gcc/src/real.c 176.gcc/src/dbxout.c 176.gcc/src/sdbout.c 176.gcc/src/dwarfout.c 176.gcc/src/xcoffout.c 176.gcc/src/integrate.c 176.gcc/src/jump.c 176.gcc/src/cse.c 176.gcc/src/loop.c 176.gcc/src/unroll.c 176.gcc/src/flow.c 176.gcc/src/stupid.c 176.gcc/src/combine.c 176.gcc/src/regclass.c 176.gcc/src/local-alloc.c 176.gcc/src/global.c 176.gcc/src/reload.c 176.gcc/src/reload1.c 176.gcc/src/caller-save.c 176.gcc/src/insn-peep.c 176.gcc/src/reorg.c 176.gcc/src/sched.c 176.gcc/src/final.c 176.gcc/src/recog.c 176.gcc/src/reg-stack.c 176.gcc/src/insn-opinit.c 176.gcc/src/insn-recog.c 176.gcc/src/insn-extract.c 176.gcc/src/insn-output.c 176.gcc/src/insn-emit.c 176.gcc/src/insn-attrtab.c 176.gcc/src/m88k.c 176.gcc/src/getpwd.c 176.gcc/src/convert.c 176.gcc/src/bc-emit.c 176.gcc/src/bc-optab.c 176.gcc/src/obstack.c 
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:=-O3
include $(BUILD_SHARED_LIBRARY)
#################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := gccO3F
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/176.gcc/headers
LOCAL_SRC_FILES := 176.gcc/src/toplevO3F.c 176.gcc/src/c-parse.c 176.gcc/src/c-lang.c 176.gcc/src/c-lex.c 176.gcc/src/c-pragma.c 176.gcc/src/c-decl.c 176.gcc/src/c-typeck.c 176.gcc/src/c-convert.c 176.gcc/src/c-aux-info.c 176.gcc/src/c-common.c 176.gcc/src/c-iterate.c 176.gcc/src/version.c 176.gcc/src/tree.c 176.gcc/src/print-tree.c 176.gcc/src/stor-layout.c 176.gcc/src/fold-const.c 176.gcc/src/function.c 176.gcc/src/stmt.c 176.gcc/src/expr.c 176.gcc/src/calls.c 176.gcc/src/expmed.c 176.gcc/src/explow.c 176.gcc/src/optabs.c 176.gcc/src/varasm.c 176.gcc/src/rtl.c 176.gcc/src/print-rtl.c 176.gcc/src/rtlanal.c 176.gcc/src/emit-rtl.c 176.gcc/src/real.c 176.gcc/src/dbxout.c 176.gcc/src/sdbout.c 176.gcc/src/dwarfout.c 176.gcc/src/xcoffout.c 176.gcc/src/integrate.c 176.gcc/src/jump.c 176.gcc/src/cse.c 176.gcc/src/loop.c 176.gcc/src/unroll.c 176.gcc/src/flow.c 176.gcc/src/stupid.c 176.gcc/src/combine.c 176.gcc/src/regclass.c 176.gcc/src/local-alloc.c 176.gcc/src/global.c 176.gcc/src/reload.c 176.gcc/src/reload1.c 176.gcc/src/caller-save.c 176.gcc/src/insn-peep.c 176.gcc/src/reorg.c 176.gcc/src/sched.c 176.gcc/src/final.c 176.gcc/src/recog.c 176.gcc/src/reg-stack.c 176.gcc/src/insn-opinit.c 176.gcc/src/insn-recog.c 176.gcc/src/insn-extract.c 176.gcc/src/insn-output.c 176.gcc/src/insn-emit.c 176.gcc/src/insn-attrtab.c 176.gcc/src/m88k.c 176.gcc/src/getpwd.c 176.gcc/src/convert.c 176.gcc/src/bc-emit.c 176.gcc/src/bc-optab.c 176.gcc/src/obstack.c 
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:=-Ofast
include $(BUILD_SHARED_LIBRARY)
#################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := vortex
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/255.vortex/headers
LOCAL_SRC_FILES := 255.vortex/src/bitvec.c 255.vortex/src/bmt.c 255.vortex/src/bmt0.c 255.vortex/src/bmt01.c 255.vortex/src/bmt10.c 255.vortex/src/bmtlib.c 255.vortex/src/bmtobj.c 255.vortex/src/core01.c 255.vortex/src/dba.c 255.vortex/src/dbm0.c 255.vortex/src/dbm1.c 255.vortex/src/dbm2.c 255.vortex/src/domain.c 255.vortex/src/draw07.c 255.vortex/src/draw7.c 255.vortex/src/drawlib.c 255.vortex/src/drawobj.c 255.vortex/src/emplib.c 255.vortex/src/empobj.c 255.vortex/src/env0.c 255.vortex/src/env01.c 255.vortex/src/env1.c 255.vortex/src/fm.c 255.vortex/src/gdbm.c 255.vortex/src/grp0.c 255.vortex/src/grp1.c 255.vortex/src/grp2.c 255.vortex/src/hm.c 255.vortex/src/iam.c 255.vortex/src/ifm.c 255.vortex/src/im.c 255.vortex/src/km.c 255.vortex/src/list01.c 255.vortex/src/mem00.c 255.vortex/src/mem01.c 255.vortex/src/mem10.c 255.vortex/src/oa0.c 255.vortex/src/oa1.c 255.vortex/src/oadmp.c 255.vortex/src/obj01.c 255.vortex/src/odbm.c 255.vortex/src/ogrp.c 255.vortex/src/om.c 255.vortex/src/point.c 255.vortex/src/primal.c 255.vortex/src/pstub.c 255.vortex/src/query.c 255.vortex/src/rect.c 255.vortex/src/rects.c 255.vortex/src/sa.c 255.vortex/src/shell.c 255.vortex/src/sm.c 255.vortex/src/testobj.c 255.vortex/src/tm.c 255.vortex/src/trans00.c 255.vortex/src/trans01.c 255.vortex/src/trans10.c 255.vortex/src/trans20.c 255.vortex/src/tree0.c 255.vortex/src/tree00.c 255.vortex/src/tree01.c 255.vortex/src/ut.c 255.vortex/src/vchunk.c 255.vortex/src/vdbm.c 255.vortex/src/voa.c 255.vortex/src/vom.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
include $(BUILD_SHARED_LIBRARY)
##################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := vortexO1
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/255.vortex/headers
LOCAL_SRC_FILES := 255.vortex/src/bitvec.c 255.vortex/src/bmt.c 255.vortex/src/bmt0O1.c 255.vortex/src/bmt01.c 255.vortex/src/bmt10.c 255.vortex/src/bmtlib.c 255.vortex/src/bmtobj.c 255.vortex/src/core01.c 255.vortex/src/dba.c 255.vortex/src/dbm0.c 255.vortex/src/dbm1.c 255.vortex/src/dbm2.c 255.vortex/src/domain.c 255.vortex/src/draw07.c 255.vortex/src/draw7.c 255.vortex/src/drawlib.c 255.vortex/src/drawobj.c 255.vortex/src/emplib.c 255.vortex/src/empobj.c 255.vortex/src/env0.c 255.vortex/src/env01.c 255.vortex/src/env1.c 255.vortex/src/fm.c 255.vortex/src/gdbm.c 255.vortex/src/grp0.c 255.vortex/src/grp1.c 255.vortex/src/grp2.c 255.vortex/src/hm.c 255.vortex/src/iam.c 255.vortex/src/ifm.c 255.vortex/src/im.c 255.vortex/src/km.c 255.vortex/src/list01.c 255.vortex/src/mem00.c 255.vortex/src/mem01.c 255.vortex/src/mem10.c 255.vortex/src/oa0.c 255.vortex/src/oa1.c 255.vortex/src/oadmp.c 255.vortex/src/obj01.c 255.vortex/src/odbm.c 255.vortex/src/ogrp.c 255.vortex/src/om.c 255.vortex/src/point.c 255.vortex/src/primal.c 255.vortex/src/pstub.c 255.vortex/src/query.c 255.vortex/src/rect.c 255.vortex/src/rects.c 255.vortex/src/sa.c 255.vortex/src/shell.c 255.vortex/src/sm.c 255.vortex/src/testobj.c 255.vortex/src/tm.c 255.vortex/src/trans00.c 255.vortex/src/trans01.c 255.vortex/src/trans10.c 255.vortex/src/trans20.c 255.vortex/src/tree0.c 255.vortex/src/tree00.c 255.vortex/src/tree01.c 255.vortex/src/ut.c 255.vortex/src/vchunk.c 255.vortex/src/vdbm.c 255.vortex/src/voa.c 255.vortex/src/vom.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:=-O1
include $(BUILD_SHARED_LIBRARY)
##################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := vortexO2
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/255.vortex/headers
LOCAL_SRC_FILES := 255.vortex/src/bitvec.c 255.vortex/src/bmt.c 255.vortex/src/bmt0O2.c 255.vortex/src/bmt01.c 255.vortex/src/bmt10.c 255.vortex/src/bmtlib.c 255.vortex/src/bmtobj.c 255.vortex/src/core01.c 255.vortex/src/dba.c 255.vortex/src/dbm0.c 255.vortex/src/dbm1.c 255.vortex/src/dbm2.c 255.vortex/src/domain.c 255.vortex/src/draw07.c 255.vortex/src/draw7.c 255.vortex/src/drawlib.c 255.vortex/src/drawobj.c 255.vortex/src/emplib.c 255.vortex/src/empobj.c 255.vortex/src/env0.c 255.vortex/src/env01.c 255.vortex/src/env1.c 255.vortex/src/fm.c 255.vortex/src/gdbm.c 255.vortex/src/grp0.c 255.vortex/src/grp1.c 255.vortex/src/grp2.c 255.vortex/src/hm.c 255.vortex/src/iam.c 255.vortex/src/ifm.c 255.vortex/src/im.c 255.vortex/src/km.c 255.vortex/src/list01.c 255.vortex/src/mem00.c 255.vortex/src/mem01.c 255.vortex/src/mem10.c 255.vortex/src/oa0.c 255.vortex/src/oa1.c 255.vortex/src/oadmp.c 255.vortex/src/obj01.c 255.vortex/src/odbm.c 255.vortex/src/ogrp.c 255.vortex/src/om.c 255.vortex/src/point.c 255.vortex/src/primal.c 255.vortex/src/pstub.c 255.vortex/src/query.c 255.vortex/src/rect.c 255.vortex/src/rects.c 255.vortex/src/sa.c 255.vortex/src/shell.c 255.vortex/src/sm.c 255.vortex/src/testobj.c 255.vortex/src/tm.c 255.vortex/src/trans00.c 255.vortex/src/trans01.c 255.vortex/src/trans10.c 255.vortex/src/trans20.c 255.vortex/src/tree0.c 255.vortex/src/tree00.c 255.vortex/src/tree01.c 255.vortex/src/ut.c 255.vortex/src/vchunk.c 255.vortex/src/vdbm.c 255.vortex/src/voa.c 255.vortex/src/vom.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:=-O2
include $(BUILD_SHARED_LIBRARY)
##################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := vortexO3
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/255.vortex/headers
LOCAL_SRC_FILES := 255.vortex/src/bitvec.c 255.vortex/src/bmt.c 255.vortex/src/bmt0O3.c 255.vortex/src/bmt01.c 255.vortex/src/bmt10.c 255.vortex/src/bmtlib.c 255.vortex/src/bmtobj.c 255.vortex/src/core01.c 255.vortex/src/dba.c 255.vortex/src/dbm0.c 255.vortex/src/dbm1.c 255.vortex/src/dbm2.c 255.vortex/src/domain.c 255.vortex/src/draw07.c 255.vortex/src/draw7.c 255.vortex/src/drawlib.c 255.vortex/src/drawobj.c 255.vortex/src/emplib.c 255.vortex/src/empobj.c 255.vortex/src/env0.c 255.vortex/src/env01.c 255.vortex/src/env1.c 255.vortex/src/fm.c 255.vortex/src/gdbm.c 255.vortex/src/grp0.c 255.vortex/src/grp1.c 255.vortex/src/grp2.c 255.vortex/src/hm.c 255.vortex/src/iam.c 255.vortex/src/ifm.c 255.vortex/src/im.c 255.vortex/src/km.c 255.vortex/src/list01.c 255.vortex/src/mem00.c 255.vortex/src/mem01.c 255.vortex/src/mem10.c 255.vortex/src/oa0.c 255.vortex/src/oa1.c 255.vortex/src/oadmp.c 255.vortex/src/obj01.c 255.vortex/src/odbm.c 255.vortex/src/ogrp.c 255.vortex/src/om.c 255.vortex/src/point.c 255.vortex/src/primal.c 255.vortex/src/pstub.c 255.vortex/src/query.c 255.vortex/src/rect.c 255.vortex/src/rects.c 255.vortex/src/sa.c 255.vortex/src/shell.c 255.vortex/src/sm.c 255.vortex/src/testobj.c 255.vortex/src/tm.c 255.vortex/src/trans00.c 255.vortex/src/trans01.c 255.vortex/src/trans10.c 255.vortex/src/trans20.c 255.vortex/src/tree0.c 255.vortex/src/tree00.c 255.vortex/src/tree01.c 255.vortex/src/ut.c 255.vortex/src/vchunk.c 255.vortex/src/vdbm.c 255.vortex/src/voa.c 255.vortex/src/vom.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:=-O3	
include $(BUILD_SHARED_LIBRARY)
##################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := vortexO3F
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/255.vortex/headers
LOCAL_SRC_FILES := 255.vortex/src/bitvec.c 255.vortex/src/bmt.c 255.vortex/src/bmt0O3F.c 255.vortex/src/bmt01.c 255.vortex/src/bmt10.c 255.vortex/src/bmtlib.c 255.vortex/src/bmtobj.c 255.vortex/src/core01.c 255.vortex/src/dba.c 255.vortex/src/dbm0.c 255.vortex/src/dbm1.c 255.vortex/src/dbm2.c 255.vortex/src/domain.c 255.vortex/src/draw07.c 255.vortex/src/draw7.c 255.vortex/src/drawlib.c 255.vortex/src/drawobj.c 255.vortex/src/emplib.c 255.vortex/src/empobj.c 255.vortex/src/env0.c 255.vortex/src/env01.c 255.vortex/src/env1.c 255.vortex/src/fm.c 255.vortex/src/gdbm.c 255.vortex/src/grp0.c 255.vortex/src/grp1.c 255.vortex/src/grp2.c 255.vortex/src/hm.c 255.vortex/src/iam.c 255.vortex/src/ifm.c 255.vortex/src/im.c 255.vortex/src/km.c 255.vortex/src/list01.c 255.vortex/src/mem00.c 255.vortex/src/mem01.c 255.vortex/src/mem10.c 255.vortex/src/oa0.c 255.vortex/src/oa1.c 255.vortex/src/oadmp.c 255.vortex/src/obj01.c 255.vortex/src/odbm.c 255.vortex/src/ogrp.c 255.vortex/src/om.c 255.vortex/src/point.c 255.vortex/src/primal.c 255.vortex/src/pstub.c 255.vortex/src/query.c 255.vortex/src/rect.c 255.vortex/src/rects.c 255.vortex/src/sa.c 255.vortex/src/shell.c 255.vortex/src/sm.c 255.vortex/src/testobj.c 255.vortex/src/tm.c 255.vortex/src/trans00.c 255.vortex/src/trans01.c 255.vortex/src/trans10.c 255.vortex/src/trans20.c 255.vortex/src/tree0.c 255.vortex/src/tree00.c 255.vortex/src/tree01.c 255.vortex/src/ut.c 255.vortex/src/vchunk.c 255.vortex/src/vdbm.c 255.vortex/src/voa.c 255.vortex/src/vom.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:=-Ofast
include $(BUILD_SHARED_LIBRARY)
##################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := twolf
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/300.twolf/headers
LOCAL_SRC_FILES := 300.twolf/src/acceptt.c 300.twolf/src/addimp.c 300.twolf/src/alignfeed.c 300.twolf/src/buildimp.c 300.twolf/src/changrid.c 300.twolf/src/clean.c 300.twolf/src/closepins.c 300.twolf/src/config1.c 300.twolf/src/configure.c 300.twolf/src/configuref.c 300.twolf/src/controlf.c 300.twolf/src/countf.c 300.twolf/src/date.c 300.twolf/src/debug.c 300.twolf/src/dimbox.c 300.twolf/src/finalwire.c 300.twolf/src/findcost.c 300.twolf/src/findcostf.c 300.twolf/src/findest.c 300.twolf/src/findfeeds.c 300.twolf/src/findrchk.c 300.twolf/src/findrcost.c 300.twolf/src/findunlap.c 300.twolf/src/globe.c 300.twolf/src/globedbg.c 300.twolf/src/globroute.c 300.twolf/src/gparser.c 300.twolf/src/grdcell.c 300.twolf/src/hash.c 300.twolf/src/implfeeds.c 300.twolf/src/main.c 300.twolf/src/mergplist.c 300.twolf/src/move.c 300.twolf/src/mt.c 300.twolf/src/okmalloc.c 300.twolf/src/outcm.c 300.twolf/src/outpins.c 300.twolf/src/output.c 300.twolf/src/parser.c 300.twolf/src/purcost.c 300.twolf/src/qsorte.c 300.twolf/src/qsortg.c 300.twolf/src/qsortgdx.c 300.twolf/src/qsortx.c 300.twolf/src/rand.c 300.twolf/src/readblck.c 300.twolf/src/readcell.c 300.twolf/src/readnets.c 300.twolf/src/readpar.c 300.twolf/src/readseg.c 300.twolf/src/savewolf.c 300.twolf/src/sortpin.c 300.twolf/src/stats.c 300.twolf/src/uc0.c 300.twolf/src/ucg0.c 300.twolf/src/ucgxp.c 300.twolf/src/uclosepns.c 300.twolf/src/ucxx1.c 300.twolf/src/ucxx2.c 300.twolf/src/ucxxo1.c 300.twolf/src/ucxxo2.c 300.twolf/src/ucxxp.c 300.twolf/src/uglobe.c 300.twolf/src/uglobrout.c 300.twolf/src/ugpair.c 300.twolf/src/uloop.c 300.twolf/src/uloop2.c 300.twolf/src/unetseg.c 300.twolf/src/unlap.c 300.twolf/src/upair.c 300.twolf/src/urcost.c 300.twolf/src/utemp.c 300.twolf/src/utils.c 300.twolf/src/xcompact.c 300.twolf/src/xpickint.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
include $(BUILD_SHARED_LIBRARY)
###################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := twolfO1
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/300.twolf/headers
LOCAL_SRC_FILES := 300.twolf/src/acceptt.c 300.twolf/src/addimp.c 300.twolf/src/alignfeed.c 300.twolf/src/buildimp.c 300.twolf/src/changrid.c 300.twolf/src/clean.c 300.twolf/src/closepins.c 300.twolf/src/config1.c 300.twolf/src/configure.c 300.twolf/src/configuref.c 300.twolf/src/controlf.c 300.twolf/src/countf.c 300.twolf/src/date.c 300.twolf/src/debug.c 300.twolf/src/dimbox.c 300.twolf/src/finalwire.c 300.twolf/src/findcost.c 300.twolf/src/findcostf.c 300.twolf/src/findest.c 300.twolf/src/findfeeds.c 300.twolf/src/findrchk.c 300.twolf/src/findrcost.c 300.twolf/src/findunlap.c 300.twolf/src/globe.c 300.twolf/src/globedbg.c 300.twolf/src/globroute.c 300.twolf/src/gparser.c 300.twolf/src/grdcell.c 300.twolf/src/hash.c 300.twolf/src/implfeeds.c 300.twolf/src/mainO1.c 300.twolf/src/mergplist.c 300.twolf/src/move.c 300.twolf/src/mt.c 300.twolf/src/okmalloc.c 300.twolf/src/outcm.c 300.twolf/src/outpins.c 300.twolf/src/output.c 300.twolf/src/parser.c 300.twolf/src/purcost.c 300.twolf/src/qsorte.c 300.twolf/src/qsortg.c 300.twolf/src/qsortgdx.c 300.twolf/src/qsortx.c 300.twolf/src/rand.c 300.twolf/src/readblck.c 300.twolf/src/readcell.c 300.twolf/src/readnets.c 300.twolf/src/readpar.c 300.twolf/src/readseg.c 300.twolf/src/savewolf.c 300.twolf/src/sortpin.c 300.twolf/src/stats.c 300.twolf/src/uc0.c 300.twolf/src/ucg0.c 300.twolf/src/ucgxp.c 300.twolf/src/uclosepns.c 300.twolf/src/ucxx1.c 300.twolf/src/ucxx2.c 300.twolf/src/ucxxo1.c 300.twolf/src/ucxxo2.c 300.twolf/src/ucxxp.c 300.twolf/src/uglobe.c 300.twolf/src/uglobrout.c 300.twolf/src/ugpair.c 300.twolf/src/uloop.c 300.twolf/src/uloop2.c 300.twolf/src/unetseg.c 300.twolf/src/unlap.c 300.twolf/src/upair.c 300.twolf/src/urcost.c 300.twolf/src/utemp.c 300.twolf/src/utils.c 300.twolf/src/xcompact.c 300.twolf/src/xpickint.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:=-O1
include $(BUILD_SHARED_LIBRARY)
###################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := twolfO2
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/300.twolf/headers
LOCAL_SRC_FILES := 300.twolf/src/acceptt.c 300.twolf/src/addimp.c 300.twolf/src/alignfeed.c 300.twolf/src/buildimp.c 300.twolf/src/changrid.c 300.twolf/src/clean.c 300.twolf/src/closepins.c 300.twolf/src/config1.c 300.twolf/src/configure.c 300.twolf/src/configuref.c 300.twolf/src/controlf.c 300.twolf/src/countf.c 300.twolf/src/date.c 300.twolf/src/debug.c 300.twolf/src/dimbox.c 300.twolf/src/finalwire.c 300.twolf/src/findcost.c 300.twolf/src/findcostf.c 300.twolf/src/findest.c 300.twolf/src/findfeeds.c 300.twolf/src/findrchk.c 300.twolf/src/findrcost.c 300.twolf/src/findunlap.c 300.twolf/src/globe.c 300.twolf/src/globedbg.c 300.twolf/src/globroute.c 300.twolf/src/gparser.c 300.twolf/src/grdcell.c 300.twolf/src/hash.c 300.twolf/src/implfeeds.c 300.twolf/src/mainO2.c 300.twolf/src/mergplist.c 300.twolf/src/move.c 300.twolf/src/mt.c 300.twolf/src/okmalloc.c 300.twolf/src/outcm.c 300.twolf/src/outpins.c 300.twolf/src/output.c 300.twolf/src/parser.c 300.twolf/src/purcost.c 300.twolf/src/qsorte.c 300.twolf/src/qsortg.c 300.twolf/src/qsortgdx.c 300.twolf/src/qsortx.c 300.twolf/src/rand.c 300.twolf/src/readblck.c 300.twolf/src/readcell.c 300.twolf/src/readnets.c 300.twolf/src/readpar.c 300.twolf/src/readseg.c 300.twolf/src/savewolf.c 300.twolf/src/sortpin.c 300.twolf/src/stats.c 300.twolf/src/uc0.c 300.twolf/src/ucg0.c 300.twolf/src/ucgxp.c 300.twolf/src/uclosepns.c 300.twolf/src/ucxx1.c 300.twolf/src/ucxx2.c 300.twolf/src/ucxxo1.c 300.twolf/src/ucxxo2.c 300.twolf/src/ucxxp.c 300.twolf/src/uglobe.c 300.twolf/src/uglobrout.c 300.twolf/src/ugpair.c 300.twolf/src/uloop.c 300.twolf/src/uloop2.c 300.twolf/src/unetseg.c 300.twolf/src/unlap.c 300.twolf/src/upair.c 300.twolf/src/urcost.c 300.twolf/src/utemp.c 300.twolf/src/utils.c 300.twolf/src/xcompact.c 300.twolf/src/xpickint.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:=-O2
include $(BUILD_SHARED_LIBRARY)
###################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := twolfO3
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/300.twolf/headers
LOCAL_SRC_FILES := 300.twolf/src/acceptt.c 300.twolf/src/addimp.c 300.twolf/src/alignfeed.c 300.twolf/src/buildimp.c 300.twolf/src/changrid.c 300.twolf/src/clean.c 300.twolf/src/closepins.c 300.twolf/src/config1.c 300.twolf/src/configure.c 300.twolf/src/configuref.c 300.twolf/src/controlf.c 300.twolf/src/countf.c 300.twolf/src/date.c 300.twolf/src/debug.c 300.twolf/src/dimbox.c 300.twolf/src/finalwire.c 300.twolf/src/findcost.c 300.twolf/src/findcostf.c 300.twolf/src/findest.c 300.twolf/src/findfeeds.c 300.twolf/src/findrchk.c 300.twolf/src/findrcost.c 300.twolf/src/findunlap.c 300.twolf/src/globe.c 300.twolf/src/globedbg.c 300.twolf/src/globroute.c 300.twolf/src/gparser.c 300.twolf/src/grdcell.c 300.twolf/src/hash.c 300.twolf/src/implfeeds.c 300.twolf/src/mainO3.c 300.twolf/src/mergplist.c 300.twolf/src/move.c 300.twolf/src/mt.c 300.twolf/src/okmalloc.c 300.twolf/src/outcm.c 300.twolf/src/outpins.c 300.twolf/src/output.c 300.twolf/src/parser.c 300.twolf/src/purcost.c 300.twolf/src/qsorte.c 300.twolf/src/qsortg.c 300.twolf/src/qsortgdx.c 300.twolf/src/qsortx.c 300.twolf/src/rand.c 300.twolf/src/readblck.c 300.twolf/src/readcell.c 300.twolf/src/readnets.c 300.twolf/src/readpar.c 300.twolf/src/readseg.c 300.twolf/src/savewolf.c 300.twolf/src/sortpin.c 300.twolf/src/stats.c 300.twolf/src/uc0.c 300.twolf/src/ucg0.c 300.twolf/src/ucgxp.c 300.twolf/src/uclosepns.c 300.twolf/src/ucxx1.c 300.twolf/src/ucxx2.c 300.twolf/src/ucxxo1.c 300.twolf/src/ucxxo2.c 300.twolf/src/ucxxp.c 300.twolf/src/uglobe.c 300.twolf/src/uglobrout.c 300.twolf/src/ugpair.c 300.twolf/src/uloop.c 300.twolf/src/uloop2.c 300.twolf/src/unetseg.c 300.twolf/src/unlap.c 300.twolf/src/upair.c 300.twolf/src/urcost.c 300.twolf/src/utemp.c 300.twolf/src/utils.c 300.twolf/src/xcompact.c 300.twolf/src/xpickint.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:=-O3
include $(BUILD_SHARED_LIBRARY)
###################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := twolfO3F
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/300.twolf/headers
LOCAL_SRC_FILES := 300.twolf/src/acceptt.c 300.twolf/src/addimp.c 300.twolf/src/alignfeed.c 300.twolf/src/buildimp.c 300.twolf/src/changrid.c 300.twolf/src/clean.c 300.twolf/src/closepins.c 300.twolf/src/config1.c 300.twolf/src/configure.c 300.twolf/src/configuref.c 300.twolf/src/controlf.c 300.twolf/src/countf.c 300.twolf/src/date.c 300.twolf/src/debug.c 300.twolf/src/dimbox.c 300.twolf/src/finalwire.c 300.twolf/src/findcost.c 300.twolf/src/findcostf.c 300.twolf/src/findest.c 300.twolf/src/findfeeds.c 300.twolf/src/findrchk.c 300.twolf/src/findrcost.c 300.twolf/src/findunlap.c 300.twolf/src/globe.c 300.twolf/src/globedbg.c 300.twolf/src/globroute.c 300.twolf/src/gparser.c 300.twolf/src/grdcell.c 300.twolf/src/hash.c 300.twolf/src/implfeeds.c 300.twolf/src/mainO3F.c 300.twolf/src/mergplist.c 300.twolf/src/move.c 300.twolf/src/mt.c 300.twolf/src/okmalloc.c 300.twolf/src/outcm.c 300.twolf/src/outpins.c 300.twolf/src/output.c 300.twolf/src/parser.c 300.twolf/src/purcost.c 300.twolf/src/qsorte.c 300.twolf/src/qsortg.c 300.twolf/src/qsortgdx.c 300.twolf/src/qsortx.c 300.twolf/src/rand.c 300.twolf/src/readblck.c 300.twolf/src/readcell.c 300.twolf/src/readnets.c 300.twolf/src/readpar.c 300.twolf/src/readseg.c 300.twolf/src/savewolf.c 300.twolf/src/sortpin.c 300.twolf/src/stats.c 300.twolf/src/uc0.c 300.twolf/src/ucg0.c 300.twolf/src/ucgxp.c 300.twolf/src/uclosepns.c 300.twolf/src/ucxx1.c 300.twolf/src/ucxx2.c 300.twolf/src/ucxxo1.c 300.twolf/src/ucxxo2.c 300.twolf/src/ucxxp.c 300.twolf/src/uglobe.c 300.twolf/src/uglobrout.c 300.twolf/src/ugpair.c 300.twolf/src/uloop.c 300.twolf/src/uloop2.c 300.twolf/src/unetseg.c 300.twolf/src/unlap.c 300.twolf/src/upair.c 300.twolf/src/urcost.c 300.twolf/src/utemp.c 300.twolf/src/utils.c 300.twolf/src/xcompact.c 300.twolf/src/xpickint.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS	:=-Ofast
include $(BUILD_SHARED_LIBRARY)
###################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := vpr
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/175.vpr/headers
LOCAL_SRC_FILES := 175.vpr/src/main.c 175.vpr/src/util.c 175.vpr/src/read_netlist.c 175.vpr/src/read_arch.c 175.vpr/src/place.c 175.vpr/src/route.c 175.vpr/src/stats.c 175.vpr/src/segment_stats.c 175.vpr/src/rr_graph.c 175.vpr/src/rr_graph2.c 175.vpr/src/rr_graph_sbox.c 175.vpr/src/rr_graph_util.c 175.vpr/src/rr_graph_timing_params.c 175.vpr/src/rr_graph_area.c 175.vpr/src/check_rr_graph.c 175.vpr/src/check_route.c 175.vpr/src/hash.c 175.vpr/src/read_place.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS := -DLINUX_i386
include $(BUILD_SHARED_LIBRARY)
###################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := vprO1
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/175.vpr/headers
LOCAL_SRC_FILES := 175.vpr/src/mainO1.c 175.vpr/src/util.c 175.vpr/src/read_netlist.c 175.vpr/src/read_arch.c 175.vpr/src/place.c 175.vpr/src/route.c 175.vpr/src/stats.c 175.vpr/src/segment_stats.c 175.vpr/src/rr_graph.c 175.vpr/src/rr_graph2.c 175.vpr/src/rr_graph_sbox.c 175.vpr/src/rr_graph_util.c 175.vpr/src/rr_graph_timing_params.c 175.vpr/src/rr_graph_area.c 175.vpr/src/check_rr_graph.c 175.vpr/src/check_route.c 175.vpr/src/hash.c 175.vpr/src/read_place.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS := -DLINUX_i386 -O1
include $(BUILD_SHARED_LIBRARY)
###################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := vprO2
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/175.vpr/headers
LOCAL_SRC_FILES := 175.vpr/src/mainO2.c 175.vpr/src/util.c 175.vpr/src/read_netlist.c 175.vpr/src/read_arch.c 175.vpr/src/place.c 175.vpr/src/route.c 175.vpr/src/stats.c 175.vpr/src/segment_stats.c 175.vpr/src/rr_graph.c 175.vpr/src/rr_graph2.c 175.vpr/src/rr_graph_sbox.c 175.vpr/src/rr_graph_util.c 175.vpr/src/rr_graph_timing_params.c 175.vpr/src/rr_graph_area.c 175.vpr/src/check_rr_graph.c 175.vpr/src/check_route.c 175.vpr/src/hash.c 175.vpr/src/read_place.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS := -DLINUX_i386 -O2
include $(BUILD_SHARED_LIBRARY)
###################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := vprO3
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/175.vpr/headers
LOCAL_SRC_FILES := 175.vpr/src/mainO3.c 175.vpr/src/util.c 175.vpr/src/read_netlist.c 175.vpr/src/read_arch.c 175.vpr/src/place.c 175.vpr/src/route.c 175.vpr/src/stats.c 175.vpr/src/segment_stats.c 175.vpr/src/rr_graph.c 175.vpr/src/rr_graph2.c 175.vpr/src/rr_graph_sbox.c 175.vpr/src/rr_graph_util.c 175.vpr/src/rr_graph_timing_params.c 175.vpr/src/rr_graph_area.c 175.vpr/src/check_rr_graph.c 175.vpr/src/check_route.c 175.vpr/src/hash.c 175.vpr/src/read_place.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS := -DLINUX_i386 -O3
include $(BUILD_SHARED_LIBRARY)
###################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := vprO3F
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/175.vpr/headers
LOCAL_SRC_FILES := 175.vpr/src/mainO3F.c 175.vpr/src/util.c 175.vpr/src/read_netlist.c 175.vpr/src/read_arch.c 175.vpr/src/place.c 175.vpr/src/route.c 175.vpr/src/stats.c 175.vpr/src/segment_stats.c 175.vpr/src/rr_graph.c 175.vpr/src/rr_graph2.c 175.vpr/src/rr_graph_sbox.c 175.vpr/src/rr_graph_util.c 175.vpr/src/rr_graph_timing_params.c 175.vpr/src/rr_graph_area.c 175.vpr/src/check_rr_graph.c 175.vpr/src/check_route.c 175.vpr/src/hash.c 175.vpr/src/read_place.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS := -DLINUX_i386 -Ofast
include $(BUILD_SHARED_LIBRARY)
###################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := crafty
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/186.crafty/headers
LOCAL_SRC_FILES := 186.crafty/src/searchr.c 186.crafty/src/search.c 186.crafty/src/repeat.c 186.crafty/src/next.c 186.crafty/src/nextr.c 186.crafty/src/history.c 186.crafty/src/nexte.c 186.crafty/src/quiesce.c 186.crafty/src/evaluate.c 186.crafty/src/movgen.c 186.crafty/src/make.c 186.crafty/src/unmake.c 186.crafty/src/lookup.c 186.crafty/src/store.c 186.crafty/src/attacks.c 186.crafty/src/swap.c 186.crafty/src/boolean.c 186.crafty/src/draw.c 186.crafty/src/utility.c 186.crafty/src/valid.c 186.crafty/src/drawn.c 186.crafty/src/edit.c 186.crafty/src/enprise.c 186.crafty/src/init.c 186.crafty/src/input.c 186.crafty/src/interupt.c 186.crafty/src/iterate.c 186.crafty/src/main.c 186.crafty/src/option.c 186.crafty/src/output.c 186.crafty/src/phase.c 186.crafty/src/ponder.c 186.crafty/src/preeval.c 186.crafty/src/root.c 186.crafty/src/setboard.c 186.crafty/src/time.c 186.crafty/src/validate.c 186.crafty/src/data.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS := -DLINUX_i386
include $(BUILD_SHARED_LIBRARY)
#####################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := craftyO1
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/186.crafty/headers
LOCAL_SRC_FILES := 186.crafty/src/searchr.c 186.crafty/src/search.c 186.crafty/src/repeat.c 186.crafty/src/next.c 186.crafty/src/nextr.c 186.crafty/src/history.c 186.crafty/src/nexte.c 186.crafty/src/quiesce.c 186.crafty/src/evaluate.c 186.crafty/src/movgen.c 186.crafty/src/make.c 186.crafty/src/unmake.c 186.crafty/src/lookup.c 186.crafty/src/store.c 186.crafty/src/attacks.c 186.crafty/src/swap.c 186.crafty/src/boolean.c 186.crafty/src/draw.c 186.crafty/src/utility.c 186.crafty/src/valid.c 186.crafty/src/drawn.c 186.crafty/src/edit.c 186.crafty/src/enprise.c 186.crafty/src/init.c 186.crafty/src/input.c 186.crafty/src/interupt.c 186.crafty/src/iterate.c 186.crafty/src/mainO1.c 186.crafty/src/option.c 186.crafty/src/output.c 186.crafty/src/phase.c 186.crafty/src/ponder.c 186.crafty/src/preeval.c 186.crafty/src/root.c 186.crafty/src/setboard.c 186.crafty/src/time.c 186.crafty/src/validate.c 186.crafty/src/data.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS := -DLINUX_i386 -O1
include $(BUILD_SHARED_LIBRARY)
#####################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := craftyO2
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/186.crafty/headers
LOCAL_SRC_FILES := 186.crafty/src/searchr.c 186.crafty/src/search.c 186.crafty/src/repeat.c 186.crafty/src/next.c 186.crafty/src/nextr.c 186.crafty/src/history.c 186.crafty/src/nexte.c 186.crafty/src/quiesce.c 186.crafty/src/evaluate.c 186.crafty/src/movgen.c 186.crafty/src/make.c 186.crafty/src/unmake.c 186.crafty/src/lookup.c 186.crafty/src/store.c 186.crafty/src/attacks.c 186.crafty/src/swap.c 186.crafty/src/boolean.c 186.crafty/src/draw.c 186.crafty/src/utility.c 186.crafty/src/valid.c 186.crafty/src/drawn.c 186.crafty/src/edit.c 186.crafty/src/enprise.c 186.crafty/src/init.c 186.crafty/src/input.c 186.crafty/src/interupt.c 186.crafty/src/iterate.c 186.crafty/src/mainO2.c 186.crafty/src/option.c 186.crafty/src/output.c 186.crafty/src/phase.c 186.crafty/src/ponder.c 186.crafty/src/preeval.c 186.crafty/src/root.c 186.crafty/src/setboard.c 186.crafty/src/time.c 186.crafty/src/validate.c 186.crafty/src/data.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS := -DLINUX_i386 -O2
include $(BUILD_SHARED_LIBRARY)
#####################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := craftyO3
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/186.crafty/headers
LOCAL_SRC_FILES := 186.crafty/src/searchr.c 186.crafty/src/search.c 186.crafty/src/repeat.c 186.crafty/src/next.c 186.crafty/src/nextr.c 186.crafty/src/history.c 186.crafty/src/nexte.c 186.crafty/src/quiesce.c 186.crafty/src/evaluate.c 186.crafty/src/movgen.c 186.crafty/src/make.c 186.crafty/src/unmake.c 186.crafty/src/lookup.c 186.crafty/src/store.c 186.crafty/src/attacks.c 186.crafty/src/swap.c 186.crafty/src/boolean.c 186.crafty/src/draw.c 186.crafty/src/utility.c 186.crafty/src/valid.c 186.crafty/src/drawn.c 186.crafty/src/edit.c 186.crafty/src/enprise.c 186.crafty/src/init.c 186.crafty/src/input.c 186.crafty/src/interupt.c 186.crafty/src/iterate.c 186.crafty/src/mainO3.c 186.crafty/src/option.c 186.crafty/src/output.c 186.crafty/src/phase.c 186.crafty/src/ponder.c 186.crafty/src/preeval.c 186.crafty/src/root.c 186.crafty/src/setboard.c 186.crafty/src/time.c 186.crafty/src/validate.c 186.crafty/src/data.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS := -DLINUX_i386 -O3
include $(BUILD_SHARED_LIBRARY)
#####################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE    := craftyO3F
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/186.crafty/headers
LOCAL_SRC_FILES := 186.crafty/src/searchr.c 186.crafty/src/search.c 186.crafty/src/repeat.c 186.crafty/src/next.c 186.crafty/src/nextr.c 186.crafty/src/history.c 186.crafty/src/nexte.c 186.crafty/src/quiesce.c 186.crafty/src/evaluate.c 186.crafty/src/movgen.c 186.crafty/src/make.c 186.crafty/src/unmake.c 186.crafty/src/lookup.c 186.crafty/src/store.c 186.crafty/src/attacks.c 186.crafty/src/swap.c 186.crafty/src/boolean.c 186.crafty/src/draw.c 186.crafty/src/utility.c 186.crafty/src/valid.c 186.crafty/src/drawn.c 186.crafty/src/edit.c 186.crafty/src/enprise.c 186.crafty/src/init.c 186.crafty/src/input.c 186.crafty/src/interupt.c 186.crafty/src/iterate.c 186.crafty/src/mainO3F.c 186.crafty/src/option.c 186.crafty/src/output.c 186.crafty/src/phase.c 186.crafty/src/ponder.c 186.crafty/src/preeval.c 186.crafty/src/root.c 186.crafty/src/setboard.c 186.crafty/src/time.c 186.crafty/src/validate.c 186.crafty/src/data.c
LOCAL_LDLIBS    := -lm -llog -ljnigraphics
LOCAL_CFLAGS := -DLINUX_i386 -Ofast
include $(BUILD_SHARED_LIBRARY)
#####################################################################################

