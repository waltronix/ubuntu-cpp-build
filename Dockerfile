FROM ubuntu:focal

# Install Build Tools excluding workloads and components with known issues.
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
        git cmake ninja-build \
        clang clang-tidy clang-format clang-tools lld lldb

RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100 \
 && update-alternatives --install /usr/bin/ld ld /usr/bin/lld 100
