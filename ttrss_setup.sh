#!/bin/bash
# create mysql user and mysql database, from environment vars if any
# Create ENV vars shortcuts
PSQL_IP=${POSTGRES_IP}
PSQL_PORT=${POSTGRES_PORT}
HOST_IP=${TTRSS_HOSTNAME}
DB_NAME=${TTRSS_DB_NAME:=ttrss}	# Default database name to 'ttrss'
DB_USER=${TTRSS_DB_USER:=ttrss}	# Default database user to 'ttrss'
DB_PASSWORD=${TTRSS_DB_PASSWORD} # Default user password to linked mysql container root password


# replace database credentials in tt-rss config template
mv /var/www/tt-rss/config.php config.php.backup
sed 's/%DB_NAME%/'${DB_NAME}'/;
s/%DB_USER%/'${DB_USER}'/;
s/%DB_PASSWORD%/'${DB_PASSWORD}'/;
s/%PSQL_PORT%/'${PSQL_PORT}'/;
s/%PSQL_IP%/'${PSQL_IP}'/;
s/%HOST_IP%/'${HOST_IP}'/' /var/www/tt-rss/config-template.php > /var/www/tt-rss/config.php
exit 0
