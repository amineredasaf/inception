FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install -y php7.3 && \
    apt install -y php7.3-fpm && \
    apt install -y php7.3-mysql && \
    apt install -y wget


COPY ./config.sh /

RUN chmod 777 ./config.sh

RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT ./config.sh
