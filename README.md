# Docker Logs Forwarder for Home Assistant

This addon allows forwarding of all Home Assistant container logs in the Home Assistant Operating System to a remote log aggregator, such as Graylog.

This addon wraps [Docker Log Forwarder](https://github.com/johntdyer/vector_log_forwarder) to ship logs elsewhere.

Why is this needed? HAOS [doesn't allow changes to daemon.json](https://github.com/home-assistant/operating-system/issues/2135), and has a bespoke logging API available from the supervisor. Instead, this addon uses the Docker SDK to attach to containers and forward their log streams. Also, it gave me a good chance to explore more golang!

## Installation

1. Add this addon repository and install the addon.
2. **DISABLE PROTECTION MODE** in the addon Info page. Otherwise, the addon will not be able to bind to the docker socket.
3. Set the `log_host_port` setting to your log input, such as `graylog.lan:5555`.
4. Start the addon and watch logs fly!

## Limitations

* Don't use this unless you're running the Home Assistant Operating System. Instead, modify the Docker configuration in `/etc/docker/daemon.json` to send logs over syslog to your log aggregagtor.
* This has only been tested with Greylog, using the "raw TCP" input. It should work with other aggregators but they have not been tested.
* Logs are still written to the HAOS host. This addon should only be used to send logs to a remote host. Ship logs to hosts running on SD cards at your own peril.
* When the addon starts, it only "tails" the logs of existing containers. In the case of a complete system reboot, logs will be missed until the addon starts.
* There's currently no support for TLS. PRs at https://github.com/johntdyer/vector_log_forwarder are welcome!

## Release Process

* The next branch represents the upcoming version of these addons.
* `config.json` will contain the version numbers of the previously set addon versions, but will have different code.
* When `next` is ready to be tagged for a release:
  1. Create a pull request against `main`, bumping the versions of each `config.json`.
  2. When the pull request has been approved, create a date-based tag such as `2022.12.01.0` on the last commit of the pull request. This will build docker containers with the version numbers in `config.json`.
  3. Merge the PR into `main` to actually promote the release to end users. Note the new version(s) in the commit message.
    - Note we do not tag `main` in git, since each addon has it's own version number.
  4. Create a new branch off of `main` setting the addon versions back to `next`. Create a PR to merge `main` into `next` to reconcile the branches.
