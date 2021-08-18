#!/usr/bin/env bash
# Install requirement
apt install wget unzip jq -y

# Get latest release tag name
tag_name="$(echo "$(curl -s https://api.github.com/repos/v2fly/v2ray-core/releases/latest | jq .tag_name)" | tr -d '"')"
download_url="https://github.com/v2fly/v2ray-core/releases/download/${tag_name}/v2ray-linux-64.zip"

# Download latest binary zip
wget ${download_url} -O /tmp/v2ray-linux-64.zip
mkdir ./v2ray && unzip /tmp/v2ray-linux-64.zip -d ./v2ray
cp ./config.json.template ./v2ray/
# Build image
docker build -t nzzz964/v2fly:latest ./

rm -rf ./v2ray
exit 0
