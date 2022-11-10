#!/usr/bin/with-contenv bashio

set -x

host=$(bashio::config "log_destination_address")
./docker-log-forwarder -log-destination-address $host
