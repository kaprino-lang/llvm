FROM ubuntu:20.04
ENV DEBIAN_FRONTEND "noninteractive"

RUN \
    ####################################
    #
    # Install dependencies
    #
    ####################################
    apt-get update \
    && apt-get install -y \
        build-essential \
        cmake \
        curl \
        git \
        ninja-build \
        python3 \
        wget \
        zlib1g \
    ####################################
    #
    # Build LLVM
    #
    ####################################
    && mkdir /root/tmp \
    && cd /root/tmp \
    && wget https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/llvm-9.0.1.src.tar.xz \
    && tar xJf llvm-9.0.1.src.tar.xz \
    && mv /root/tmp/llvm-9.0.1.src /root/tmp/llvm \
    && mkdir -p /root/tmp/llvm/build \
    && cd /root/tmp/llvm/build \
    && cmake .. \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_INSTALL_PREFIX=$HOME/llvm-9 \
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
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV LLVM_SYS_90_PREFIX /root/llvm-9
ENV PATH $PATH:/root/.cargo/bin
