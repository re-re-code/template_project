# ベースイメージとしてUbuntu 22.04を指定
FROM ubuntu:22.04

# インタラクティブインストールの問題を防ぐための環境変数設定
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# ロケール環境変数設定
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

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
WORKDIR /work

# コンテナのデフォルト動作（停止しないよう無限ループ）
CMD ["tail", "-f", "/dev/null"]