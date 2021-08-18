FROM ubuntu:bionic

ENV V2RAY_PATH=/v2ray \
    PATH=${PATH}:${V2RAY_PATH} \
    V2FLY_VMESS_TAG_NAME=nzzz \
    V2FLY_VMESS_LISTEN_PORT=20443 \
    V2FLY_VMESS_LISTEN_ADDR=127.0.0.1 \
    V2FLY_API_LISTEN_ADDR=127.0.0.1 \
    V2FLY_API_LISTEN_PORT=10085 \
    SERVER_NAME=localhost \
    NGINX_HTTP_LISTEN_PORT=80 \
    NGINX_HTTPS_LISTEN_PORT=443

WORKDIR ${V2RAY_PATH}

COPY ./sources.list /etc/apt/sources.list

RUN  apt update \
    && apt install -y \
    nginx \
    supervisor \
    gettext-base \
    && apt autoremove -y \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./v2ray ${V2RAY_PATH}

COPY ./nginxconf /etc/nginx
COPY ./fakeweb /fakeweb
COPY ./ssl /ssl

COPY ./supervisor /etc/supervisor

COPY ./init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE \
    80 \
    443

CMD ["/init.sh"]
