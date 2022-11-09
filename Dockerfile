ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.15

FROM alpine:3.15 AS builder
RUN apk add wget
ARG VERSION=0.1.3
ENV VERSION=${VERSION}
COPY arch.sh .
COPY get.sh .
RUN chmod +x arch.sh get.sh

RUN ./get.sh

FROM $BUILD_FROM
ENV LANG C.UTF-8

COPY --from=builder docker-log-forwarder .
RUN chmod +x docker-log-forwarder

# Run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
