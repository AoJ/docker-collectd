#!/bin/sh
set -e

/usr/bin/confd -onetime -verbose -backend env -confdir /etc/confd

/usr/sbin/collectd -f
