#!/bin/sh

wget https://github.com/deviantintegral/docker-log-forwarder/releases/download/v$VERSION/docker-log-forwarder_$VERSION_Linux_\$(./arch.sh).tar.gz
tar xzvf docker-log-forwarder_0.1.2_Linux_\$(./arch.sh).tar.gz
