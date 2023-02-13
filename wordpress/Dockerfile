FROM debian:buster

RUN apt-get -y update && apt-get upgrade -y

RUN apt-get install -y php7.3 && \
    apt-get install -y php7.3-fpm && \
    apt-get install -y php7.3-mysql && \
    apt-get install -y wget

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --path=/var/www/ --allow-root

RUN wp config create --path=/var/www/ --dbname=_DataBase --dbuser=_userRsaf --dbpass=root --allow-root

ENTRYPOINT ["/bin/bash"]