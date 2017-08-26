# inspired by official image

#FROM resin/raspberry-pi3-buildpack-deps as build-stage
#FROM resin/raspberry-pi-golang
FROM hypriot/rpi-alpine as build-stage

MAINTAINER Soeren Stelzer

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf \
RUN && apk add --no-cache \
           iputils \
           ca-certificates \
           net-snmp-tools \
    && update-ca-certificates

ENV TELEGRAF_VERSION 1.3.3
ENV TELEGRAF_FILE telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz
ENV TELEGRAF_URL https://dl.influxdata.com/telegraf/releases/${TELEGRAF_FILE}

RUN set -ex \
    && apk add --no-cache --virtual .build-deps wget gnupg tar \
    && for key in \
        05CE15085FC09D18E99EFB22684A14CF2582E0C5 ; \
    do \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
        gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
        gpg --keyserver keyserver.pgp.com --recv-keys "$key" ; \
    done \
    && wget -q ${TELEGRAF_URL}.asc \
    && wget -q ${TELEGRAF_URL} \
    && gpg --batch --verify ${TELEGRAF_FILE}.asc ${TELEGRAF_FILE} \
    && mkdir -p /usr/src /etc/telegraf \
    && tar -C /usr/src -xzf ${TELEGRAF_FILE}
#    mv /usr/src/telegraf*/telegraf.conf /etc/telegraf/ && \
#    chmod +x /usr/src/telegraf*/* && \
#    cp -a /usr/src/telegraf*/* /usr/bin/ && \
#    rm -rf *.tar.gz* /usr/src /root/.gnupg && \
#    apk del .build-deps

FROM hypriot/rpi-alpine

COPY --from=build-stage /usr/src/telegraf/ /
COPY entrypoint.sh /entrypoint.sh

RUN apk --no-cache add ca-certificates \
    && chmod +x /usr/bin/telegraf \
    && chmod +x /entrypoint.sh

EXPOSE 8125/udp 8092/udp 8094

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]

