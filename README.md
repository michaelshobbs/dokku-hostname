# dokku-hostname [![Build Status](https://img.shields.io/travis/michaelshobbs/dokku-hostname.svg?branch=master "Build Status")](https://travis-ci.org/michaelshobbs/dokku-hostname)

Sets the docker hostname option for dokku (https://github.com/progrium/dokku)

Currently just sets --hostname=`hostname`.

## requirements

- dokku 0.4.0+
- docker 1.8.x


## installation

```shell
# on 0.3.x
cd /var/lib/dokku/plugins
git clone https://github.com/michaelshobbs/dokku-hostname.git dokku-hostname
dokku plugins-install

# on 0.4.x
dokku plugin:install https://github.com/michaelshobbs/dokku-hostname.git dokku-hostname
```

## hooks

This plugin provides hooks:

* `docker-args-build`: adds the `--hostname` env var to the host's `hostname`
* `docker-args-deploy`: adds the `--hostname` env var to the host's `hostname`
* `docker-args-run`: adds the `--hostname` env var to the host's `hostname`
