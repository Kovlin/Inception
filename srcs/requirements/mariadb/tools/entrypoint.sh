#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then

    # if the mysql database does not exist

    mysql_install_db --auth-root-socket-user=USER

    # initializes the MariaDB data directory and creates the system tables in the mysql database

fi

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

    # if the wordpress database does not exist

    service mysql start

    mysql -u root -e "  DROP DATABASE IF EXISTS ${DB_NAME}"
    mysql -u root -e "  CREATE DATABASE IF NOT EXISTS ${DB_NAME}"

    # the database that will be used with the wordpress website is created

    mysql -u root -e "  CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'"
    mysql -u root -e "  GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' \
                        IDENTIFIED BY '${DB_PASSWORD}' WITH GRANT OPTION"
    mysql -u root -e "  FLUSH PRIVILEGES"

    # a new user identified by DB_USER & DB_PASSWORD (the same as in the wp-config) is created
    # he can connect to the database DB_NAME from any IP

    service mysql stop
fi

mysqld_safe

# used to keep mariadb running in foreground

# SELECT User, Host FROM mysql.user; to show 'user'@'host'