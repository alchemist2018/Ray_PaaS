FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
&& mkdir -m 777 /v2ray \
&& curl -L -H "Cache-Control: no-cache" -o /v2ray/v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v4.21.3/v2ray-linux-64.zip \
&& unzip /v2ray/v2ray.zip -d /v2ray/ \
&& rm -rf /v2ray/v2ray.zip \
&& rm -rf /v2ray/config.json \
&& rm -rf /v2ray/geoip.dat \
&& rm -rf /v2ray/geosite.dat \
&& curl -L -H "Cache-Control: no-cache" -o /v2ray/config.json https://raw.githubusercontent.com/alchemist2018/scripts/master/Configfile/ray/server_config_vmess.json \
&& apk del .build-deps

CMD /v2ray/v2ray