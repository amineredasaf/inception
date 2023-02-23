
#!/bin/sh

mkdir -p var/www/html
rm -rf var/www/html/*

chmod 777 /var/www/html

mkdir -p /run/php


wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

wp core download --path=${WP_PATH} --allow-root

wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --path=${WP_PATH} --allow-root --skip-check
cat /var/www/html/wp-config.php

wp core install --path=${WP_PATH} --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_PASS} --admin_email=${WP_EMAIL} --skip-email --allow-root

wp user create ${WP_ADMIN} ${WP_EMAIL} --user_pass=${WP_PASS} --role=author --allow-root --path=${WP_PATH}

php-fpm7.3 --nodaemonize