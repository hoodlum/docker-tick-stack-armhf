#!/bin/sh
set -e

if [ "$1" = 'config' ]; then
    set -- kapacitord "$@"
fi


exec "$@"

if [ "${1:0:1}" = '-' ]; then
    set -- kapacitord "$@"
fi

KAPACITOR_HOSTNAME=${KAPACITOR_HOSTNAME:-$HOSTNAME}
export KAPACITOR_HOSTNAME

exec "$@"
