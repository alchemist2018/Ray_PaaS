FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
&& mkdir -m 777 /v2ray \
&& cd /v2ray \
&& curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v4.21.3/v2ray-linux-64.zip \
&& unzip /v2ray/v2ray.zip \
&& rm -rf /v2ray/v2ray.zip \
&& rm -rf /v2ray/config.json \
&& apk del .build-deps

ADD /config/server_config.json /v2ray/config.json

CMD /v2ray/v2ray