FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install -y php7.3 && \
    apt install -y php7.3-fpm && \
    apt install -y php7.3-mysql && \
    apt install -y wget


COPY ./config.sh /

RUN chmod 777 ./config.sh

RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/local/bin/wp


# RUN wp core download --path=/var/www/html --allow-root

# RUN wp config create --path=/var/www/html --dbname=_DataBase --dbhost=mariadb --dbuser=_userRsaf --dbpass=root --allow-root

# RUN ./config.sh

ENTRYPOINT ./config.sh
# RUN mkdir -p var/www/html

# RUN chown -R www-data:www-data /var/www/html

# RUN wp core download --path=/var/www/html --allow-root && wp config create --path=/var/www/html --dbname=db --dbuser=rsaf --dbhost=mariadb --dbpass=rsaf --allow-root

# RUN wp core install --allow-root --url="rsaf.42.fr" --title="rsaf" --admin_user="rsaf" --admin_password="rsaf69" --admin_email="rsaf@gmail.com" --path=/var/www/html 
# ENTRYPOINT ["/bin/bash"]
