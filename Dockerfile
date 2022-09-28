# FROM adoptopenjdk/openjdk11:alpine-slim
FROM debian:stable-slim
# FROM alpine:3.16.2

RUN apt update && apt install -y curl python3 git
# RUN apk add curl python3 git gcompat
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN curl -Lo bazelisk https://github.com/bazelbuild/bazelisk/releases/download/v1.14.0/bazelisk-linux-amd64 &&\
    mv bazelisk /usr/bin/bazel &&\
    chmod ugo+rx /usr/bin/bazel

ENTRYPOINT ["/bin/bash"]
