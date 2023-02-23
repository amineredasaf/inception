FROM debian:buster
ARG DB_HOST
ARG DB_PORT
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOTUSER
ARG DB_ROOTPASS
ARG WP_PATH
ARG WP_TITLE
ARG WP_ADMIN
ARG WP_PASS
ARG WP_USER
ARG WP_USERPASS
ARG WP_EMAIL
ARG WP_URL

RUN apt update -y
RUN apt install -y php7.3 && \
    apt install -y php7.3-fpm && \
    apt install -y php7.3-mysql && \
    apt install -y wget
COPY ./config.sh /
RUN chmod 777 ./config.sh && ./config.sh
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
ENTRYPOINT ["php-fpm7.3" "--nodaemonize"]
