FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y

# RUN mysql_secure_installation

RUN mkdir /mariadb

WORKDIR /mariadb

COPY database.sql /mariadb/conf/

RUN sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start && mysql < conf/database.sql

ENTRYPOINT ["mysqld_safe"]
# RUN mysql < conf/database.sql