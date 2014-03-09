native:
	android-ndk-r9b/ndk-build
release:
	android-ndk-r9b/ndk-build
	ant release
debug:
	android-ndk-r9b/ndk-build
	ant debug
key:	
	./key.sh
