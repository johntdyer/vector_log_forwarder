# Docker Logs Forwarder for Home Assistant

This addon allows forwarding of all Home Assistant container logs in the Home Assistant Operating System to a remote log aggregator, such as Graylog.

This addon wraps [Docker Log Forwarder](https://github.com/deviantintegral/docker-log-forwarder) to ship logs elsewhere.

Why is this needed? HAOS [doesn't allow changes to daemon.json](https://github.com/home-assistant/operating-system/issues/2135), and has a bespoke logging API available from the supervisor. Instead, this addon uses the Docker SDK to attach to containers and forward their log streams. Also, it gave me a good chance to explore more golang!

## Installation

1. Add this addon repository and install the addon.
2. Set the `log_host_port` setting to your log input, such as `graylog.lan:5555`.
3. Start the addon and watch logs fly!

## Limitations

* Don't use this unless you're running the Home Assistant Operating System. Instead, modify the Docker configuration in `/etc/docker/daemon.json` to send logs over syslog to your log aggregagtor.
* This has only been tested with Greylog, using the "raw TCP" input. It should work with other aggregators but they have not been tested.
* Logs are still written to the HAOS host. This addon should only be used to send logs to a remote host. Ship logs to hosts running on SD cards at your own peril.
* When the addon starts, it only "tails" the logs of existing containers. In the case of a complete system reboot, logs will be missed until the addon starts.
* There's currently no support for TLS. PRs at https://github.com/deviantintegral/docker-log-forwarder are welcome!
