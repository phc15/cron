#!/bin/bash

# monitor database status
# who you want to notify 
notificationto=''
# check mailq status by count the mailq, tail reads the final line and print the fifth word, 
mailq_count=`/usr/bin/mailq | /usr/bin/tail -n1 | /usr/bin/awk '{print $5}'`
mailq_count=$((mailq_count+0))
echo "Total requests is $mailq_count"

# ps = process status, -e Write information for all processes.  (Equivalent to −A.),  −f  Generate a full listing. (See the STDOUT section for the contents of a full listing.)
# grep -v grep = do not show 'grep' process
# grep mysqld = show the 'mysqld' process
# wc -l = word count 
# check the process status of mysqld, if word count less or equal to 0, it means mysql is not running.
if (( $(ps -ef | grep -v grep | grep mysqld | wc -l) <= 0 ))
then
        echo "MySQL is currently not running and will be started." | mail -s "MySQL may have crashed or not connected yet, try to automatically connect now" $notificationto
    	# restore when crush, delete and replace with your mysql server path
    	/usr/local/Cellar/mysql/5.7.20_1/support-files/mysql.server start
else
    echo "MySQL is running normal"
fi
# send email to notify the database is running and restore status


# check if mailq works, if mail system is down, send a test mail first, then restart postfix
if [[ "$mailq_count" -gt "1000" ]]; then
	#statements
	echo date | mail -s "The mailq system exceed $mail_count and might not work properly, automatically send this test mail and restart postfix." $notificationto
    postfix stop && postfix start
else
	echo "Postfix and Mail Queue is Running"
fi



