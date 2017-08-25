#Multistage Build

# Step 1 - Build telegraf
# Step 2 - Build Image only with

FROM arm32v7/golang:latest as build-stage

ENV GOPATH /go
ENV GOBIN /go/bin

RUN mkdir /go && \
    cd $GOPATH/src/github.com/influxdata/telegraf && \
    make

FROM hypriot/rpi-alpine:latest
#next time build: multiarch/alpine:armhf-edge

#RUN go get github.com/influxdata/telegraf
COPY --from=build-stage $GOBIN $GOBIN

ENTRYPOINT ["/go/bin/telegraf"]
#CMD /go/bin/telegraf
