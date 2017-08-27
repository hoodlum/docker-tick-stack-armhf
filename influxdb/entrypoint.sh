#!/bin/sh
set -e

if [ "${1}" = 'console' ]; then
    set -- /usr/bin/influx "$@"
fi

if [ "${1}" = 'influxd' ]; then
    set -- /usr/bin/influxd "$@"
fi

if [ "${1}" = 'influxdb' ]; then
    set -- /usr/bin/influxd "$@"
fi

exec "$@"
