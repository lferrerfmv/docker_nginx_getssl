#!/bin/sh

set -e

if [ ! -f "/getssl/getssl" ]; then
    cp -r /tmp_getssl /getssl
fi
