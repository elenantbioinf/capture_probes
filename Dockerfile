FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    tabix \
    tree

RUN echo 'export PS1="\[\e[1;92m\][capture_probes]\[\e[0m\] \[\e[1;96m\]\u@\h\[\e[0m\]:\[\e[1;93m\]\w\[\e[0m\]\$ "' >> /root/.bashrc

WORKDIR /workspace