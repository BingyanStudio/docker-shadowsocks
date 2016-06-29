#!/usr/bin/env sh

[ "$DNSMASQ_PORT" ] && {
    dnsmasq --server $DNS_SERVER --port $DNSMASQ_PORT -Rdq &
}

exec ss-server -s $SERVER_ADDR \
               -p $SERVER_PORT \
               -k "$PASSWORD" \
               -m $METHOD \
               -t $TIMEOUT \
               $($FAST_OPEN && echo --fast-open) \
               $($UDP_RELAY && echo -u) \
               $($VERBOSE && echo -v) \
               $EXTRA_FLAGS
