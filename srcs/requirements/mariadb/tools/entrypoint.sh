#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then

    mysql_install_db --auth-root-socket-user=USER

    # install mariadb-server in /var/lib/mysql directory

fi

# service mysql start

# mkdir -p /run/mysqld
# chown -R mysql:mysql /run/mysqld

# chown -R mysql:mysql /var/lib/mysql/

# chmod 777 /var/lib/mysql/

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

    service mysql start
    # following instructions will be executed only if the wordpress database does not exists yet

    # echo "DROP DATABASE IF EXISTS $DB_NAME;" | mysql -u root
    # echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root;

    # # the database that will be used with the wordpress website is created

    # echo "CREATE USER IF NOT EXISTS \'$DB_USER\'@\'$WP_NETWORK_NAME\' IDENTIFIED BY \'$DB_PASSWORD\';" | mysql -u root;
    # echo "GRANT ALL PRIVILEGES ON $DB_NAME TO \'$DB_USER\'$WP_NETWORK_NAME\' IDENTIFIED BY \'$DB_PASSWORD\';" | mysql -u root;
    # echo "FLUSH PRIVILEGES;" | mysql -u root;

    # # a new user is added to the users to be able to connect from wordpress container


    mysql -u root -e "DROP DATABASE IF EXISTS ${DB_NAME}"
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}"

    # the database that will be used with the wordpress website is created

    mysql -u root -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'"
    mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'"
    mysql -u root -e "FLUSH PRIVILEGES"

    # a new user is added to the users to be able to connect from wordpress container

    service mysql stop
fi

mysqld_safe

# used to keep mariadb running in foreground

# SELECT User, Host FROM mysql.user;