# This is a temporary hack. For some reasons building backtrace-sys fails
# to locate C compiler. My guess is that this is related to `cc` crate which
# compiles C source code. In addition `cc` does compiler discovery.
export PATH=/opt/android-ndk/arm/bin:$PATH

cargo build --target=armv7-linux-androideabi
