FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV TAGS=core,terminal,config,dev
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential sudo && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS workstation

COPY . .
CMD ["sh", "-c", "ansible-playbook --ask-vault-pass --tags $TAGS unix.yml"]

