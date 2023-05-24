#!/usr/bin/with-contenv bashio

host=$(bashio::config "log_destination_address")
./vector -w --config-toml /share/vector/vector.toml

