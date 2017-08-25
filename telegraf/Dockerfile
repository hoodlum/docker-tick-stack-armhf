#Multistage Build

# Step 1 - Build telegraf
# Step 2 - Build Image only with

FROM arm32v7/golang:latest

WORKDIR /go/src/github.com/alexellis/href-counter/
RUN go get -d -v golang.org/x/net/html


FROM hypriot/rpi-alpine:latest
#next time build: multiarch/alpine:armhf-edge

RUN mkdir /go
ENV GOPATH /go
ENV GOBIN /go/bin
VOLUME /etc/telegraf
ENV TELEGRAF github.com/influxdata/telegraf
WORKDIR $GOPATH/src/$TELEGRAF/
#RUN go get github.com/influxdata/telegraf
COPY . $GOPATH/src/$TELEGRAF/
RUN set -ex && \
	  apk add --no-cache --virtual .build-deps \
		git \
		go \
		build-base && \
		go get github.com/sparrc/gdm && \
		/go/bin/gdm restore && \
    go install cmd/telegraf/telegraf.go && \
    apk del .build-deps && \
	  rm -rf $GOPATH/pkg && \
	  rm -rf $GOPATH/src && \
	  rm -rf /usr && \
	  rm -rf $GOPATH/bin/gdm

ENTRYPOINT ["/go/bin/telegraf"]
#CMD /go/bin/telegraf
