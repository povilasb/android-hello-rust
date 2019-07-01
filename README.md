# About

This is the simplest possible project that exposes some Rust functionality
to be used for Android apps.

The project includes [Dockerfile](./Dockerfile) which describes the build
environment: Android SDK, NDK, Rust with different toolchains for different
Android targets like ARMv7, AArch64, etc.

Build Android app:
```bash
$ cd hellorust
$ ./gradlew build
$ ./gradlew installDebug
```
