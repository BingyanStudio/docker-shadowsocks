#!/usr/bin/env sh

POLIPO_CACHE=/var/cache/polipo
mkdir -p "$POLIPO_CACHE"

[ "$PROGRAM" = "ss-local" ] && {
    polipo proxyAddress="::0" \
           diskCacheRoot="$POLIPO_CACHE" \
           socksParentProxy="127.0.0.1:${LOCAL_PORT}" \
           socksProxyType=socks5 &
}

exec $PROGRAM -s "$SERVER_ADDR" \
              -p "$SERVER_PORT" \
              -l "$LOCAL_PORT" \
              -b "$LOCAL_ADDR" \
              -k "$PASSWORD" \
              -m "$METHOD" \
              -t "$TIMEOUT" \
              $($FAST_OPEN && echo --fast-open) \
              $($UDP_RELAY && echo -u) \
              $($VERBOSE && echo -v) \
              $EXTRA_FLAGS
