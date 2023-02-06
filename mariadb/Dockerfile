FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y

# RUN mysql_secure_installation

RUN mkdir /mariadb

WORKDIR /mariadb

COPY database.sql /mariadb/conf/

RUN service mysql start && mysql < conf/database.sql

# RUN mysql < conf/database.sql