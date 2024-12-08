FROM ubuntu:22.04

# パッケージインストールスクリプトを実行
COPY settings/install_packages.sh /work/settings/
COPY settings/requirements_linux.txt /work/settings/
COPY settings/requirements_py.txt /work/settings/
RUN bash /work/settings/install_packages.sh

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

CMD ["tail", "-f", "/dev/null"]