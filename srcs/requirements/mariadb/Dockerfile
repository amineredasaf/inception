FROM debian:buster
ARG DB_HOST
ARG DB_PORT
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOTUSER
ARG DB_ROOTPASS

RUN apt update -y
RUN apt install mariadb-server procps -y
WORKDIR /mariadb
COPY tools/db_Init.sh .
RUN chmod 777 db_Init.sh && ./db_Init.sh
RUN cat database.sql
RUN sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN cat database.sql
RUN service mysql start && mysql < database.sql
ENTRYPOINT ["mysqld_safe"]