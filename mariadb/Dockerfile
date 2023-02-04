FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server

RUN mysql_secure_installation

