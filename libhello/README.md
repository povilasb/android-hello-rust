# About

JNI library implemented in Rust that can be imported in Android project.

## Usage

``` bash
$ cargo build --target=armv7-linux-androideabi
```

This will produce shared library:
```bash
$ ls target/armv7-linux-androideabi/debug/*.so
target/armv7-linux-androideabi/debug/libhello_rust.so
```
