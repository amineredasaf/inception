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
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p var/www/html
RUN mkdir -p /run/php
RUN rm -rf var/www/html/*
RUN chmod 777 /var/www/html
RUN wp core download --path=/var/www/html --allow-root
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --path=/var/www/html --allow-root --skip-check
RUN cat /var/www/html/wp-config.php
# RUN wp core install --path=/var/www/html --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_PASS} --admin_email=${WP_EMAIL} --skip-email --allow-root
# RUN wp user create ${WP_ADMIN} ${WP_EMAIL} --user_pass=${WP_PASS} --role=author --allow-root --path=${WP_PATH}

COPY ./config.sh /
RUN chmod 777 ./config.sh
# RUN ./config.sh
ENTRYPOINT ./config.sh
