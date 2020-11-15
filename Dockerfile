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
        curl \
        cmake \
        git \
        python3.6 \
        wget \
        zlib1g \
    ####################################
    #
    # Build LLVM
    #
    ####################################
    && mkdir /tmp \
    && cd /tmp \
    && wget https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/llvm-9.0.1.src.tar.xz \
    && tar xJf llvm-9.0.1.src.tar.xz \
    && mv /tmp/llvm-9.0.1.src /tmp/llvm \
    && mkdir -p /tmp/llvm/build \
    && cd /tmp/llvm/build \
    && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release --build .. --target install \
    && cd / \
    ####################################
    #
    # Install Rust
    #
    ####################################
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh \
    ####################################
    #
    # Eliminate garbage
    #
    ####################################
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
