#!/bin/sh
# For logical backup -- small db better solution.
# DB credentials for database admin
user="root"
password=""
host="localhost"
db_name="testdb"

#Options
backup_path="/path/to/folder"
date=$(date +"%m-%d-%Y")

#Set default file permissions
umask 177

#Dump datbase into SQL file
mysqldump --user $user -p$password --host $host --databases $db_name > $backup_path/$db_name-$date.sql

#If the script went wrong, perform backup status to check using mysql_proecess_monitor.sh
if [[ "$?" -eq 0 ]]; then
	echo "Backup successfully"
else
	echo "Execute mysql_preocess_monitor.sh to check database status"
	# ">" means to redirect output to /dev/null (black hole), anything goes here is ignored 
	# 2>&1 cause the STDERR err output to STDOUT normal output, so it end up in /dev/null
	./mysql_process_monitor.sh > /dev/null 2>&1 
fi

#Backup more than one databases
# db_array=(db1 db2)
# for db in db_array
# 	do mysqldump --user $user -p$password --host $host --databases $db > $backup_path/$db-$date.sql
# done

#OR
#mysqldump --user $user -p$password --host $host --databases db1 db2 db3 > $backup_path/$db-$date.sql

#Backup all databases
# mysqldump -u [user] -p –all-databases > [file_name].sql

#Delete files older than 60 days
find $backup_path/* -mtime +60 -exec rm {} \;


