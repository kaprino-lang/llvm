FROM alpine:3.13

RUN \
    ####################################
    #
    # Install dependencies
    #
    ####################################
    apk add --update --no-cache -y \
        alpine-sdk \
        cmake \
        libffi-dev \
        ninja \
        python3 \
        wget \
        zlib \
    ####################################
    #
    # Build LLVM
    #
    ####################################
    && mkdir /root/tmp \
    && cd /root/tmp \
    && wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.1/llvm-11.0.1.src.tar.xz \
    && tar xJf llvm-11.0.1.src.tar.xz \
    && mv /root/tmp/llvm-11.0.1.src /root/tmp/llvm \
    && mkdir -p /root/tmp/llvm/build \
    && cd /root/tmp/llvm/build \
    && cmake .. \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_INSTALL_PREFIX=$HOME/llvm \
        -DCMAKE_BUILD_TYPE=Release \
        -G Ninja \
    && ninja \
    && ninja install \
    && rm -rf /root/tmp \
    && cd / \
    ####################################
    #
    # Install Rust
    #
    ####################################
    && curl https://sh.rustup.rs -sSf | sh -s -- -y \
    ####################################
    #
    # Eliminate garbage
    #
    ####################################
    && apk del --purge -y \
        cmake \
        ninja \
        python3 \
        wget

ENV LLVM_SYS_110_PREFIX /root/llvm
ENV PATH $PATH:/root/.cargo/bin
