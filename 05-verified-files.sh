#!/bin/sh

set -e

if [ ! -f "/root/getssl" ]; then
    cp -r /tmp_getssl/root/* /root/
fi

if [ ! -f "/etc/nginx/conf.d/default.conf" ]; then
    cp -r /etc/nginx/conf.d.tmp/* /etc/nginx/conf.d
fi

exit 0
