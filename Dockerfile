FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
&& mkdir -m 777 /v2ray \
&& curl -L -H "Cache-Control: no-cache" -o /v2ray/v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v4.28.2/v2ray-linux-64.zip \
&& unzip -j "/v2ray/v2ray.zip" "v2ray" "v2ctl" -d "/v2ray" \
&& rm -rf /v2ray/v2ray.zip \
&& curl -L -H "Cache-Control: no-cache" -o /v2ray/config.json https://raw.githubusercontent.com/alchemist2018/scripts/master/Configfile/ray/server_config.json \
&& apk del .build-deps

CMD /v2ray/v2ray
