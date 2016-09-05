SPEC CPU 2000 for Android
==============================

### Description
The SPEC CPU2000 benchmark suite was ported to android . It was complied using android ndk version 9. The app runs the benchmarks with various levels of optimisation of the complier and with different sets of inputs to the benchmarks(namely test,train and ref).<br>
The app has nine fully running benchmarks namely : 
1. Gzip
2. Bzip2
3. Parser
4. Vortex
5. Twolf
6. Gcc
7. Mcf
8. Crafty
9. Vpr

Try to use the app present in the bin folder.

### Building
- To build the apk in debug mode use "make debug".
- To build the apk in release mode use "make release". 
- To build the native code for android run "make native".
But the android toolchain needs to be present in the directory for the makefile to use the tools to compile the benchmarks. Additionally **ant** utility needs to be installed for build to succeed.The project requires ndk and sdk for android tools for development. The project has been exported from andoird studio and can be importted in Andorid studio.

## Directory Structure
- The native code is in jni folder which has all the benchmarks c code.
- src contains all the java code for the app activites.
- the assests folder has all the input files used by various benchmarks.
- The apk and its various versions are built in bin folder.Release, unsigned, unaligned all these versions of apk are produced.


### Output format
The app stores the result in html format in the external memory of the phone. The result can be shared easily using any of the sharing options avaiable in android. The output format is in the form table which contains the execution time of the benchmarks requested.

