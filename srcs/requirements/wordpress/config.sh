
#!/bin/sh

# mkdir -p var/www/html
# rm -rf var/www/html/*

# chmod 777 /var/www/html



# wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/local/bin/wp

# wp core download --path=${WP_PATH} --allow-root

# cat /var/www/html/wp-config.php
# wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST} --path=${WP_PATH} --allow-root --skip-check
# cat /var/www/html/wp-config.php

wp core install --path=/var/www/html --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_PASS} --admin_email=test@email.com --skip-email --allow-root

wp user create ${WP_USER} ${WP_EMAIL} --user_pass=${WP_USERPASS} --role=author --allow-root --path=/var/www/html

php-fpm7.3 --nodaemonize