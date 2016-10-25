FROM debian:stable

MAINTAINER Tomas Volka <tomas.volka@gmail.com>

# Install packages
RUN apt-get update; apt-get install -y --force-yes apache2 php5 php5-phalcon && apt-get clean

# run the thing
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
