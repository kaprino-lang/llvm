# Docker image for LLVM

[![Build](https://github.com/kaprino-lang/llvm/workflows/Build/badge.svg)](https://github.com/kaprino-lang/llvm/actions)
[![Docker Image Size](https://img.shields.io/docker/image-size/kaprino/llvm)](https://hub.docker.com/r/kaprino/llvm)

This repository only contains a Dockerfile which is used for constructing an image for testing kaprino.  
An image generated from this file can be used for not only testing kaprino but also working on LLVM without any struggles.

## How to use

You can use this image by executing following command.

```
docker pull kaprino/llvm:latest
```

## Informations

### Base image

Ubuntu 20.04

### Installed applications and libraries

- cargo
- cmake
- git
- libffi-dev
- llvm
- ninja
- python3
- wget

(Alphabetical order)
