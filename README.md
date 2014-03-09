The app has ten fully running benchmarks namely : 
1. Gzip
2. Bzip2
3. Parser
4. Vortex
5. Twolf
6. Gcc
7. Mcf
8. Crafty
9.Vpr



The project requires ndk and sdk for android tools for development
To do some development place ndk sdk folder downloaded from android developers site in the project directory.
The project can be also be developed using eclipse adt for which just importing the project is required.
to build the app "ant" is required.
the native code is in jni folder which has all the benchmarks c code.
src contains all the java code for the app activites.
the assests folder has all the input files used by various benchmarks.
to build the apk in release mode use "make release"
to build the apk in debug mode use "make debug"
to compile the native c code of the benchmarks use "make native"
to install the app in usb debugging mode in phone use "ant release install". This will install release apk in phone.
the apk and its various versions are built in bin folder
release, unsigned, unaligned all these versions of apk are produced.


to sign the app use "specand1" as password for both alias and keystore. 
