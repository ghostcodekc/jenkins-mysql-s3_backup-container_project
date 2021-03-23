# jenkins-mysql-s3_backup-container_project

## Setup
- Create an ssh key. 
  - I chose to name mine "remote_user_key" because the Dockerfile for our remote-host creates a user called "remote_user"
  - The default `.gitignore` in this repo will not commit `centos7/remote_user_key*`
- There are 2 example environment files. Remove the "example" out of the file name and edit the files with your correct information.
  - The default `.gitignore` in this repo will not commit `config/.env` or `config/db-variables.env`

## Backup Script Command
```
/var/run/db_backup/script.sh db {DB_PASSWORD} {DB_NAME} {S3_BACKUP_BUCKET}
```
