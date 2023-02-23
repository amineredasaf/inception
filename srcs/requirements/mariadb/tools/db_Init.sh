# !/bin/bash
echo "CREATE DATABASE IF NOT EXISTS "${DB_NAME}";" > database.sql
echo "CREATE USER IF NOT EXISTS "${DB_USER}" IDENTIFIED BY ${DB_PASSWORD};" >> database.sql
echo "GRANT ALL PRIVILEGES ON "${DB_NAME}".* TO "${DB_USER}";" >> database.sql
echo "ALTER USER ${DB_ROOTUSER}@'localhost' IDENTIFIED BY '${DB_ROOTPASS}';" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql