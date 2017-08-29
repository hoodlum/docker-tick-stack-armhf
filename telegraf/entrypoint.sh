#!/bin/sh
set -e

if [ "$1" = 'config' ]; then
    set -- telegraf "$@"
fi


exec "$@"
