# jenkins-mysql-s3_backup-container_project

## Setup
- Create an ssh key using the following command: `ssh-keygen`
  - When asked to enter the file in which to save the key enter: `{Github Repo}\centos7\remote_user_key`
    - I chose to name mine "remote_user_key" because the Dockerfile for our remote-host creates a user called "remote_user"
    - The default `.gitignore` in this repo will not commit `centos7/remote_user_key*`
- Copy the `remote_user_key` to the jenkins_ansible\config folder.
- There are 2 example environment files. Remove the "example" out of the file name and edit the files with your correct AWS information.
  - The default `.gitignore` in this repo will not commit `config/.env` or `config/db-variables.env`

## Build the images:
```
docker-compose build
```

## Start the containers
```
docker-compose up -d
```

## Accessing the remote_host container

```
docker container exec -it remote_host bash
```

## Connecting to the mysql db via remote_host container
```
mysql -h db -u root -p
```

Load the mysql 'people' data with a randomized data set that I created:
```
mysql -h db -u root -p people < /var/tmp/database.sql
```
## Commands on the remote_host container that might be helpful
This will show you the contents of your S3 backup bucket. Helpful for the restore db script.
```
aws s3 ls {BUCKET NAME}
```

## Restore mysql database
```
/var/run/db/db_restore.sh db {DB_PASSWORD} testdb {BUCKET} {BACKUP_FILENAME including `.sql`}
```
example:
> /var/run/db/db_restore.sh db {DB_PASSWORD} testdb andrewmgrube-jenkins-mysql-backup db-032421-163042.sql

## Backup Script Command
In order to back up your mysql db to S3 you will need to run the following command after accessing the remote_host.
```
/var/run/db/db_backup.sh db {DB_PASSWORD} {DB_NAME} {S3_BACKUP_BUCKET}
```

example:
> /var/run/db/db_backup.sh db {DB_PASSWORD} testdb andrewmgrube-jenkins-mysql-backup
