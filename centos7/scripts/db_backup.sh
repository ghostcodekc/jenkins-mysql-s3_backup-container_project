#/bin/bash

DATE=$(date +%m%d%y-%H%M%S)
BACKUP_NAME=db-$DATE.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
BUCKET_NAME=$4

mysqldump --column-statistics=0 -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /var/run/db/$BACKUP_NAME && \
echo "Uploading db backup" && \
aws s3 cp /var/run/db/$BACKUP_NAME s3://$BUCKET_NAME/$BACKUP_NAME

rm /var/run/db/$BACKUP_NAME