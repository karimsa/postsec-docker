# Dockerfile - postsec-docker
# 
# General purpose Dockerfile to setup Apache, PHP, MySQL
# environment for running the Post-Secondary Database Registration
# website.

FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

# copy over key temporarily
COPY config/php-ppa.key /tmp/php.key

# fetch packages
RUN apt-get update

# setup system repo & php repo
RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
RUN add-apt-repository -y 'deb [arch=amd64,i386,ppc64el] http://mirror.jmu.edu/pub/mariadb/repo/10.1/ubuntu xenial main'
RUN add-apt-repository -y 'deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main'
RUN apt-key add /tmp/php.key
RUN apt-get update -y

# install packages (broken down for better caching via docker)
RUN apt-get install -y apache2
RUN apt-get install -y mariadb-server=10.1.25+maria-1~xenial
RUN apt-get install -y php5.6 libapache2-mod-php5.6
RUN apt-get install -y imagemagick php-imagick

# define that the http port will be used
EXPOSE 80