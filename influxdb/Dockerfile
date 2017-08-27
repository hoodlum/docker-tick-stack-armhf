FROM hypriot/rpi-alpine as build-stage

MAINTAINER Soeren Stelzer

ENV TELEGRAF_VERSION 1.3.5
ENV TELEGRAF_FILE telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz
ENV TELEGRAF_URL https://dl.influxdata.com/telegraf/releases/${TELEGRAF_FILE}

RUN set -xe \
    && apk add --no-cache --virtual .build-deps ca-certificates curl tar \
    && update-ca-certificates \
    && mkdir -p /usr/src \
    && curl -sSL ${TELEGRAF_URL} | tar xz --strip 2 -C /usr/src \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

FROM hypriot/rpi-alpine

COPY --from=build-stage /usr/src /
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8125/udp 8092/udp 8094

#ENTRYPOINT ["telegraf"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"

