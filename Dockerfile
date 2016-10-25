FROM debian:stable

MAINTAINER Tomas Volka <tomas.volka@gmail.com>

# Install packages
RUN echo "deb https://packagecloud.io/phalcon/stable/debian/ jessie main" >> /etc/apt/sources.list
RUN echo "deb-src https://packagecloud.io/phalcon/stable/debian/ jessie main" >> /etc/apt/source.list
RUN apt-get update
RUN apt-get install -y apache2 php5 php5-phalcon curl sudo zip unzip git 
RUN apt-get clean

# run the thing
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
