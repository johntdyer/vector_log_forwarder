ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.15
ARG VERSION=0.1.3

FROM alpine:3.15 AS builder
RUN apk add wget
COPY arch.sh .
RUN ./get.sh

FROM $BUILD_FROM
ENV LANG C.UTF-8

COPY --from=builder docker-log-forwarder .
RUN chmod +x docker-log-forwarder

# Run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
