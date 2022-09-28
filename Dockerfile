FROM debian:stable-slim

RUN apt update && apt install -y curl python3 git sudo
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN curl -Lo bazelisk https://github.com/bazelbuild/bazelisk/releases/download/v1.14.0/bazelisk-linux-amd64 &&\
    mv bazelisk /usr/bin/bazel &&\
    chmod ugo+rx /usr/bin/bazel

RUN useradd -m -g users -G sudo,staff bazelbase &&\
    echo "bazelbase:bazelbase" | chpasswd &&\
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER bazelbase

ENTRYPOINT ["/bin/bash"]
