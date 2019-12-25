FROM shadowsocks/shadowsocks-libev:latest

USER root
RUN apk add --no-cache --virtual .build-deps ca-certificates curl gcc autoconf make libtool automake zlib-dev openssl asciidoc xmlto libpcre32 libev-dev g++ linux-headers git \
&& git clone https://github.com/shadowsocks/simple-obfs.git \
&& cd simple-obfs \
&& git submodule update --init --recursive \
&& ./autogen.sh \
&& ./configure && make \
&& make install \
&& curl -L -H "Cache-Control: no-cache" -o /config.json https://raw.githubusercontent.com/alchemist2018/scripts/master/Configfile/ss/server_config.json \
&& cd .. \
&& rm -rf simple-obfs \
&& apk del .build-deps

CMD ss-server -c config.json