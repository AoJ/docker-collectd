FROM aooj/base
MAINTAINER AooJ <aooj@n13.cz>

ENV CONFD_VERSION 0.6.3

RUN apt-get update && apt-get upgrade -y && apt-get -y install gzip collectd collectd-utils && apt-get clean

RUN wget -q -O /usr/bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64
RUN chmod +x /usr/bin/confd

RUN rm -rf /etc/collectd && mkdir -p /etc/collectd/collect.d
ADD files/etc /etc/collectd
RUN mkdir -p /etc/confd/{templates,conf.d}

ADD files/collectd-supervisor.conf /etc/supervisor/conf.d/collectd.conf
ADD files/start-collectd.sh /opt/start-collectd.sh
