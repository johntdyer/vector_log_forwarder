ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.15

FROM alpine:3.15 AS builder
RUN apk add wget
RUN wget https://github.com/deviantintegral/docker-log-forwarder/releases/download/v0.1.2/docker-log-forwarder_0.1.2_Linux_x86_64.tar.gz
RUN tar xzvf docker-log-forwarder_0.1.2_Linux_x86_64.tar.gz

FROM $BUILD_FROM
ENV LANG C.UTF-8

COPY --from=builder docker-log-forwarder .
RUN chmod +x docker-log-forwarder

# Run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
