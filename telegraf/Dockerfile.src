#Multistage Build

# Step 1 - Build telegraf
# Step 2 - Build Image only with

FROM arm32v7/golang:latest as build-stage

#ENV REPO github.com/influxdata/telegraf

ENV GOPATH /go
ENV GOBIN /go/bin

RUN go get github.com/influxdata/telegraf && \
    cd $GOPATH/src/github.com/influxdata/telegraf && \
    make

FROM hypriot/rpi-alpine:latest
#next time build: multiarch/alpine:armhf-edge

COPY --from=build-stage $GOBIN $GOBIN

ENTRYPOINT ["/go/bin/telegraf"]
#CMD /go/bin/telegraf
