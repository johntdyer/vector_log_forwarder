#!/bin/sh

ARCH=x86_64 #$(./arch.sh)

mkdir -p vector &&
  curl -v -sSfL --proto '=https' --tlsv1.2 https://packages.timber.io/vector/$VERSION/vector-$VERSION-$ARCH-unknown-linux-musl.tar.gz |
  tar xzf - -C vector --strip-components=2
