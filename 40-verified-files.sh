#!/bin/sh

set -e

if [ ! -f "/getssl/getssl" ]; then
    cp -r /tmp_getssl/getssl/* /getssl/
fi

if [ ! -f "/etc/nginx/conf.d/default.conf" ]; then
    cp -r /etc/nginx/conf.d.tmp/* /etc/nginx/conf.d
fi

exit 0
