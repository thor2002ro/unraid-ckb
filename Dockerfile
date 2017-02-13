FROM zakame/slackware:latest
MAINTAINER Simon Labrecque <simon@wegel.ca>

ADD 1-install-packages.sh /tmp/build-image/
RUN /tmp/build-image/1-install-packages.sh

ADD build-scripts/* /usr/local/sbin/build-scripts/
