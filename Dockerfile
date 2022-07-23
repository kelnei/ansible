FROM ubuntu:jammy AS base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y software-properties-common sudo && \
    add-apt-repository -y ppa:ansible/ansible && \
    apt-get install -y ansible && \
    apt-get autoremove -y && \
    apt-get autoclean

RUN apt-get install -y git curl wget stow build-essential
RUN apt-get install -y vim unzip

FROM base AS os
ENV DEBIAN_FRONTEND=dialog
RUN addgroup --gid 1000 matt
RUN adduser --shell /bin/bash --uid 1000 --disabled-password --gecos "" --gid 1000 matt
RUN usermod -aG sudo matt
RUN echo "matt ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/99_matt
USER matt
ENV USER=matt
WORKDIR /home/matt/ansible
COPY --chown=matt:matt . .
