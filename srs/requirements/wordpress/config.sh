
#!/bin/sh

mkdir -p var/www/html
rm -rf var/www/html/*

chmod 777 /var/www/html

mkdir -p /run/php


wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

wp core download --path=/var/www/html --allow-root

# wp config create --dbname=DataBase --dbhost=mariadb --dbuser=userRsaf --dbpass=root --allow-root --path=/var/www/html
wp config create --dbname="db" --dbuser="rsaf" --dbpass="rsaf" --dbhost="mariadb" --path=/var/www/html --allow-root --skip-check

wp core install --path=/var/www/html --url="rsaf.42.fr" --title="inception" --admin_user="rsaf" --admin_password=admin --admin_email="rsaf@student.1337.ma" --skip-email --allow-root

wp user create rsaf rsaf@student.1337.ma --user_pass=rsaf --role=author --allow-root --path=/var/www/html

# bash
php-fpm7.3 --nodaemonize