#!/bin/sh

# DB credentials
user="root"
password="root"
db_name="random generated"
host="localhost"
backup_path="/path/to/backup/folder/named/mysqldump"

# Create databse
mysql --user $user -p$password
mysql -e "CREATE TABLE $db_name;"
mysql -e "GRANT ALL PRIVILEGES ON $db_name.* TO $user@$host IDENTIFIED BY $password;"

#Fetch the backup from yesterday and restore
date=$(date --date="yesterday" +"%m-%d%Y")
mysql --user $user -p$password --host $host --databases $db_name < $backup_path/$db_name-$date.sql

