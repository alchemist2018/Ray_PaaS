FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
&& mkdir -m 777 /bk \
&& curl -L -H "Cache-Control: no-cache" -o /bk/bk_linux_amd64 https://github.com/txthinking/brook/releases/download/v20210101/brook_linux_amd64 \
&& chmod +x /bk/bk_linux_amd64 \
&& apk del .build-deps

CMD /bk/bk_linux_amd64 wsserver -l :80 -p W@24No --tcpTimeout 30
