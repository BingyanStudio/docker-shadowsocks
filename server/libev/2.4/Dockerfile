FROM alpine:3.3

ENV SS_VER 2.4.5
ENV SS_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz
ENV SS_DIR shadowsocks-libev-$SS_VER
ENV SS_DEP autoconf build-base curl libtool linux-headers openssl-dev

COPY ./run.sh /

RUN set -ex \
    && apk add --update $SS_DEP \
    && curl -sSL $SS_URL | tar xz \
    && cd $SS_DIR \
        && ./configure \
        && make install \
        && cd .. \
        && rm -rf $SS_DIR \
    && apk del --purge $SS_DEP \
    && rm -rf /var/cache/apk/* \
    && chmod +x /run.sh

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 998

ENV METHOD aes-256-cfb
ENV PASSWORD default

ENV TIMEOUT 300
ENV VERBOSE false
ENV UDP_RELAY false
ENV FAST_OPEN false

ENV EXTRA_FLAGS=

EXPOSE $SERVER_PORT
EXPOSE $SERVER_PORT/udp

CMD ["/run.sh"]
