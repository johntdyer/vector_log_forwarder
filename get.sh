#!/bin/sh

ARCH=$(./arch.sh)

wget https://github.com/deviantintegral/docker-log-forwarder/releases/download/v$VERSION/docker-log-forwarder_$VERSION\_Linux_$ARCH\.tar.gz
tar xzvf docker-log-forwarder_$VERSION\_Linux_$ARCH\.tar.gz
