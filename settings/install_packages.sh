#!/bin/bash
set -e  # スクリプトをエラーで停止

# カラフルなプロンプト
PS1='\[\e[32m\]\u@\h:\w\$ \[\e[0m\]'

# 更新と Linux アプリのインストール
echo "Updating and installing Linux packages..."
apt update && apt -y upgrade
xargs -a /opt/settings/requirements_linux.txt apt install -y
apt clean
rm -rf /var/lib/apt/lists/*

# Python ライブラリのインストール
echo "Installing Python libraries..."
pip install --no-cache-dir -r /opt/settings/requirements_py.txt

echo "All packages installed successfully!"