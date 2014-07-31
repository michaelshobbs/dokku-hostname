dokku-hostname
==============

Sets the docker hostname option for dokku (https://github.com/progrium/dokku)

Currently just sets --hostname=`hostname`.

## Installation

On the dokku server, you need to install the plugin in the standard Dokku way. Specifically:

```
cd /var/lib/dokku/plugins
git clone https://github.com/michaelshobbs/dokku-hostname.git
dokku plugins-install
```
