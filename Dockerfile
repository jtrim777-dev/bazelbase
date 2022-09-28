# FROM adoptopenjdk/openjdk11:alpine-slim
FROM debian:stable-slim

RUN apt update && apt install -y curl python3 git
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN curl -Lo bazelisk https://github.com/bazelbuild/bazelisk/releases/download/v1.14.0/bazelisk-linux-arm64 &&\
    mv bazelisk /usr/bin/bazel &&\
    chmod ugo+rx /usr/bin/bazel

ENTRYPOINT ["/bin/bash"]
