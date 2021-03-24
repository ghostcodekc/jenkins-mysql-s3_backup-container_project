# jenkins-mysql-s3_backup-container_project

## Setup
- Create an ssh key using the following command: `ssh-keygen`
  - When asked to enter the file in which to save the key enter: `{Github Repo}\centos7\remote_user_key`
    - I chose to name mine "remote_user_key" because the Dockerfile for our remote-host creates a user called "remote_user"
    - The default `.gitignore` in this repo will not commit `centos7/remote_user_key*`
- There are 2 example environment files. Remove the "example" out of the file name and edit the files with your correct AWS information.
  - The default `.gitignore` in this repo will not commit `config/.env` or `config/db-variables.env`

## Build the 'remote-host' image
```
docker-compose build
```

## Start the containers
```
docker-compose up -d
```

## Backup Script Command
In order to back up your mysql db to S3 you will need to run the following command after accessing the remote-host via SSH.
```
/var/run/db_backup/script.sh db {DB_PASSWORD} {DB_NAME} {S3_BACKUP_BUCKET}
```
