FROM ubuntu:22.04

RUN apt update && apt -y upgrade \
    && apt -y install sudo \
    && apt -y install python3-pip

ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1002
ARG GID=1002
ARG PASSWORD=user
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME/

COPY settings/.bashrc /home/user

CMD ["tail", "-f", "/dev/null"]