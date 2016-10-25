FROM debian:stable

MAINTAINER Tomas Volka <tomas.volka@gmail.com>

# Install packages, we need to install https apt-utils and apt-transport first
RUN apt-get update
RUN apt-get install -y -q --force-yes apt-utils
RUN apt-get install -y -q --force-yes apt-transport-https

# Add custom sources, update and install packages
RUN echo "deb http://packagecloud.io/phalcon/stable/debian/ jessie main" >> /etc/apt/sources.list
RUN echo "deb-src http://packagecloud.io/phalcon/stable/debian/ jessie main" >> /etc/apt/source.list
RUN apt-get update
RUN apt-get install -y -q --force-yes apache2 php5 php5-phalcon curl sudo zip unzip git 
RUN apt-get clean

# run the thing
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
