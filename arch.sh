#!/bin/sh

ARCH=$(arch)

if [ "$ARCH" == "aarch64" ]
then
  echo arm64
  exit
elif [ "$ARCH" == "amd64" ] 
then
  echo x86_64
  exit
else
  echo $ARCH
fi
