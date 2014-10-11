FROM aooj/base
MAINTAINER AooJ <aooj@n13.cz>


ADD ./files/build /opt/build
ADD ./files/start /opt/start
RUN /opt/build

RUN rm -rf /etc/collectd
ADD ./confd /etc/confd
ADD ./collectd /etc/collectd

ENTRYPOINT ["/bin/start"]
CMD []
