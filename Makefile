all: image

env: external_toolchain java_compiler

image: env
	(. yocto/oe-init-build-env . && bitbake core-image-minimal)

kernel: env
	(. yocto/oe-init-build-env . && bitbake virtual/kernel)

dummy: env
	(. yocto/oe-init-build-env . && bitbake ${BBCMD})

# must match with conf/local.conf EXTERNAL_TOOLCHAIN
external_toolchain: ./sourceryg++-2013.05-43

sourceryg++-2013.05-43: sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
	# md5sum ae18e084ab602a14aed4b1c2f46bc701
	mkdir -p $@
	tar -x -j --strip-components=1 -f sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2 -C ./sourceryg++-2013.05-43/

sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2:
	wget -c https://sourcery.mentor.com/GNUToolchain/package11650/public/nios2-linux-gnu/sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2

java_compiler: /usr/bin/javac

/usr/bin/javac:
	echo "Please install a java-compiler first"
	false
