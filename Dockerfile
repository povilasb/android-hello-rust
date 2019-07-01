FROM thyrlian/android-sdk

RUN echo y | sdkmanager "ndk-bundle"
ENV NDK=$ANDROID_HOME/ndk-bundle

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y curl gcc pkg-config libssl-dev

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:$PATH"
ARG rustup=/root/.cargo/bin/rustup

RUN $rustup install stable
RUN $rustup target add armv7-linux-androideabi   # for arm
RUN $rustup target add i686-linux-android        # for x86
RUN $rustup target add aarch64-linux-android     # for arm64
RUN $rustup target add x86_64-linux-android      # for x86_64

RUN mkdir /root/src
# Initialized gradle which installs other tools like adb as well
RUN cd /root/src/hellorust && ./gradlew

COPY cargo_config.toml /root/.cargo/config
