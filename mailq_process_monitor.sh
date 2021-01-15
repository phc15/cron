#!/bin/sh
notificationto=''
# check mailq status by count the mailq, tail reads the final line and print the fifth word, 
mailq_count=`/usr/bin/mailq | /usr/bin/tail -n1 | /usr/bin/awk '{print $5}'`
mailq_count=$((mailq_count+0))

# check if mailq works, if mail system is down, send a test mail first, then restart postfix
if [[ "$mailq_count" -gt "1000" ]]; then
	#statements
	echo date | mail -s "The mailq system might not work properly, automatically send this test mail to restart." $notificationto
    postfix stop && postfix start
else
	echo "Postfix and Mail Queue is Running"
fi
