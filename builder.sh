#!/usr/bin/env bash

set -ue

apt update
apt install -y wget unzip jq curl

tmpname=$(mktemp)
tag="$(echo "$(curl -s https://api.github.com/repos/v2fly/v2ray-core/releases/latest | jq .tag_name)" | tr -d '"')"
url="https://github.com/v2fly/v2ray-core/releases/download/${tag}/v2ray-linux-64.zip"
wget ${url} -O ${tmpname}

if [ ! -d ./v2ray ]; then
    mkdir ./v2ray
fi

unzip ${tmpname} -d ./v2ray