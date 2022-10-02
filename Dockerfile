FROM debian:stable-slim

RUN apt update && apt install -y curl python3 git dumb-init
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN curl -Lo bazelisk https://github.com/bazelbuild/bazelisk/releases/download/v1.14.0/bazelisk-linux-amd64 &&\
    mv bazelisk /usr/bin/bazel &&\
    chmod ugo+rx /usr/bin/bazel

RUN echo "apt install -y gcc" > /usr/bin/installgcc &&\
    chmod ug+x /usr/bin/installgcc

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/bin/bash"]
