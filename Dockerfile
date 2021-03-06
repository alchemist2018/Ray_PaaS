FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
&& mkdir -m 777 /v2ray \
&& curl -L -H "Cache-Control: no-cache" -o /v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
&& unzip -j "/v2ray/v2ray.zip" "v2ray" "v2ctl" -d "/v2ray" \
&& rm -rf /v2ray/v2ray.zip \
&& apk del .build-deps
ADD cfg.json /v2ray/config.json

CMD /v2ray/v2ray
