#/bin/bash

DATE=$(date +%m%d%y-%H%M%S)
BACKUP_NAME=db-$DATE.sql

DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
BUCKET_NAME=$4
AWS_ACCESS_KEY_ID=$5
AWS_SECRET_ACCESS_KEY=$6

mysqldump --column-statistics=0 -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /var/run/db/$BACKUP_NAME && \
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY && \
echo "Uploading db backup" && \
aws s3 cp /var/run/db/$BACKUP_NAME s3://$BUCKET_NAME/$BACKUP_NAME

rm /var/run/db/$BACKUP_NAME