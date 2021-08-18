# V2FLY DEPLOY WITH DOCKER (WS+TLS+WEB)

- Requirement
  - `A Domain`
  - `A SSL Cert`
  - `A Fakeweb source code`

- Environment
  - `docker`
  - `docker-compose`

## Usage

### 环境变量

|        环境变量         |         作用          |   默认    |
| :---------------------: | :-------------------: | :-------: |
|  V2FLY_VMESS_TAG_NAME   |  v2ray vmess 标签名   |   nzzz    |
| V2FLY_VMESS_LISTEN_PORT | v2ray vmess  监听端口 |   20443   |
| V2FLY_VMESS_LISTEN_ADDR | v2ray vmess  监听地址 | 127.0.0.1 |
|  V2FLY_API_LISTEN_ADDR  |  v2ray api 监听地址   | 127.0.0.1 |
|  V2FLY_API_LISTEN_PORT  |  v2ray api 监听端口   |   10085   |
| NGINX_HTTP_LISTEN_PORT  |  nginx http 监听端口  |    80     |
| NGINX_HTTPS_LISTEN_PORT | nginx https 监听端口  |    443    |
|       SERVER_NAME       |         域名          | localhost |

### 挂载目录

|       挂载点       |     作用      |
| :----------------: | :-----------: |
|      /fakeweb      | nginx伪装网站 |
| /ssl/fullchain.cer |    证书crt    |
|  /ssl/private.key  |    证书key    |
