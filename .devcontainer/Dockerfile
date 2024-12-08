# ベースイメージとしてUbuntu 22.04を指定
FROM ubuntu:22.04

# 必要なパッケージやPythonライブラリをインストールするスクリプトを実行
COPY settings/install_packages.sh /work/settings/ 
COPY settings/requirements_linux.txt /work/settings/ 
COPY settings/requirements_py.txt /work/settings/ 
RUN bash /work/settings/install_packages.sh 

# 開発用ユーザーを作成
ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1002
ARG GID=1002
ARG PASSWORD=user
RUN groupadd -g $GID $GROUPNAME && \ 
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \ 
    echo $USERNAME:$PASSWORD | chpasswd && \ 
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 

# 作業ディレクトリを指定
USER $USERNAME
WORKDIR /home/$USERNAME/

# コンテナのデフォルト動作（停止しないよう無限ループ）
CMD ["tail", "-f", "/dev/null"]