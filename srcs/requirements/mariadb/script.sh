#!/bin/bash

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
# sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
cp tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
service mysql start
mysql << EOF
$(cat database.sql)
EOF
# kill $(cat /var/run/mysqld/mysqld.pid)
mysqld_safe