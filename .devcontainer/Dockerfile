FROM ubuntu:22.04

RUN apt update && apt -y upgrade \
    && apt -y install ssh sudo \
    && apt clean \
    && rm -rf /var/lib/apt/list/* \
    && apt -y install python3-pip

RUN mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config

WORKDIR /root/.ssh
COPY /settings/id_rsa.pub authorized_keys

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

COPY /settings/.bashrc /home/user

EXPOSE 3007
CMD ["sudo", "/usr/sbin/sshd", "-D"]