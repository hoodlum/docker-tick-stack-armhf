
FROM hypriot/rpi-alpine as build-stage

MAINTAINER Soeren Stelzer

ENV KAPACITOR_VERSION 1.3.1
ENV KAPACITOR_FILE kapacitor-${KAPACITOR_VERSION}_linux_armhf.tar.gz
ENV KAPACITOR_URL https://dl.influxdata.com/kapacitor/releases/${KAPACITOR_FILE}

RUN set -xe \
    && apk add --no-cache --virtual .build-deps ca-certificates curl tar \
    && update-ca-certificates \
    && mkdir -p /usr/src \
    && curl -sSL ${KAPACITOR_URL} | tar xz --strip 2 -C /usr/src \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

FROM hypriot/rpi-alpine

COPY --from=build-stage /usr/src /
COPY entrypoint.sh /entrypoint.sh

EXPOSE 9092

ENTRYPOINT ["/entrypoint.sh"]
CMD ["kapacitord"]

#wget https://dl.influxdata.com/kapacitor/releases/kapacitor-1.3.1_linux_armhf.tar.gz
#VOLUME /var/lib/kapacitor
#COPY kapacitor.conf /etc/kapacitor/kapacitor.conf
#ENV KAPACITOR_HOSTNAME
