#!/bin/sh
USER="root"
PASSWORD=''
HOST="127.0.0.1"
DB="magento"
DIR="/home/user/backup"

# Backup DB
mysqldump --no-data -u$USER -p$PASSWORD -h$HOST $DB  > $DIR/backup-db-structure.sql
gzip -9 --best $DIR/backup-db-structure.sql

mysqldump --no-create-info --ignore-table=$DB.log_url --ignore-table=$DB.log_url_info --ignore-table=$DB.log_visitor --ignore-table=$DB.log_visitor_info --ignore-table=$DB.log_visitor_online -u$USER -p$PASSWORD -h$HOST $DB  > $DIR/backup-db-data.sql
gzip -9 --best $DIR/backup-db-data.sql
