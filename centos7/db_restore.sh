#!/bin/bash
# Bash script written by Andrew Grube - andrewmgrube@gmail.com

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
BUCKET_NAME=$4
BACKUP_NAME=$5

echo "Creating database table if it doesn't currently exist." && \
mysql -u root -h $DB_HOST -p${DB_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME} /*\!40100 DEFAULT CHARACTER SET utf8 */;" && \
echo "Downloading db backup" && \
aws s3 cp s3://$BUCKET_NAME/$BACKUP_NAME /var/run/db_backup/$BACKUP_NAME && \
echo "Restoring database from backup" && \
mysql -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME < $BACKUP_NAME