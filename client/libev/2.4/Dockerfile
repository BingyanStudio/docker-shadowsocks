FROM bingyan/openwrt:15.05

COPY ./run.sh /

RUN opkg update && \
    opkg install polipo "http://downloads.sourceforge.net/project/openwrt-dist/shadowsocks-libev/2.4.7-b4060bc/x86_64/shadowsocks-libev_2.4.7-1_x86_64.ipk?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fopenwrt-dist%2Ffiles%2Fshadowsocks-libev%2F2.4.7-b4060bc%2Fx86_64%2F&ts=1467166502&use_mirror=tenet" && \
    rm -rf /var/opkg-lists/* && \
    chmod +x /run.sh

ENV SS_VER 2.4.7

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 998
ENV LOCAL_ADDR 0.0.0.0
ENV LOCAL_PORT 1080

ENV METHOD aes-256-cfb
ENV PASSWORD default

ENV TIMEOUT 300
ENV VERBOSE true
ENV UDP_RELAY false
ENV FAST_OPEN false

ENV EXTRA_FLAGS=

ENV PROGRAM ss-local

EXPOSE $LOCAL_PORT
EXPOSE $LOCAL_PORT/udp
EXPOSE 8123

CMD ["/run.sh"]
