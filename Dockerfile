ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.15

FROM alpine:3.15 AS builder
RUN apk add wget curl
ARG VERSION=0.30.0
ENV VERSION=${VERSION}
COPY arch.sh .
COPY get.sh .
RUN chmod +x arch.sh get.sh

RUN ./get.sh

FROM $BUILD_FROM
ENV LANG C.UTF-8

COPY --from=builder vector/bin/vector .
# COPY --from=builder vector/config/vector.toml .
RUN chmod +x vector

# Run script
COPY run.sh /
COPY vector.toml /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
