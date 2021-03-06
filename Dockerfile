FROM debian:stable

MAINTAINER Tomas Volka <tomas.volka@gmail.com>

# Install packages, we need to install https apt-utils and apt-transport first
RUN apt-get update && \
    apt-get install -y -q --force-yes apt-utils && \
    apt-get install -y -q --force-yes apt-transport-https

# Add custom sources, update and install packages
RUN echo "deb http://packagecloud.io/phalcon/stable/debian/ jessie main" >> /etc/apt/sources.list && \
    echo "deb-src http://packagecloud.io/phalcon/stable/debian/ jessie main" >> /etc/apt/source.list

# Fetch & install everything we need
RUN apt-get update && \
    apt-get install -y -q --force-yes apache2 php5 php5-dev php5-curl php5-intl php5-phalcon php5-pgsql curl sudo zip unzip git php-pear && \
    apt-get clean

# enable rewrite
RUN a2enmod rewrite

# run the thing
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
