#!/bin/sh
set -e

if [ "${1}" = 'telegraf' ]; then
    set -- /usr/bin/telegraf "$@"
fi

if [ "${1}" = 'config' ]; then
    set -- /usr/bin/telegraf "$@"
fi


exec "$@"
