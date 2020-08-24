# StackHead: Caddy webserver module

StackHead module for using Caddy as webserver.

## System requirements

The following software is required to use this module:

* Python modules
  * passlib
  * bcrypt

## Installation

Install it via `ansible-galaxy`:

```
ansible-galaxy install getstackhead.stackhead_webserver_caddy
```

In order to use Caddy with [StackHead](https://get.stackhead.io), set `stackhead__webserver` it in your inventory file:

```yaml
---
all:
  vars:
    # Use Caddy as webserver
    stackhead__webserver: getstackhead.stackhead_webserver_caddy
  hosts:
    myserver:
      ansible_host: 123.456.789 # ...
      stackhead:
        applications:
          # ...
```
