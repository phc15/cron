#!/bin/bash

# pid changes, still use it to test if mysqld is running
date=$(date +"%b-%d-%Y""%H:%M")

process_id=`ps -fu $USER | grep "mysqld" | grep -v "grep" | awk '{print $2}'`
echo "mysql process pid"  $process_id 

# if the variable is empty "zero", then need to start mysql
if [[ -z "$process_id" ]]; then
	# call mysql_process_monitor.sh
	echo "Execute mysql_monitor.sh to check database status"
	./mysql_process_monitor.sh > /dev/null 2>&1 
else 
	#Linux
	#CPU=$(top -b -n1 | grep "myprocess" | head -1 | awk '{print $9}')
	#MEM=$(top -b -n1 | grep "myprocess" | head -1 | awk '{print $10}')
	echo "fetch memory and cpu usage."
	for i in $process_id; do 		
		# OSX
		# top -pid i -s 10 -i 2 
		# htop -p i -d 10
		# use top only once, get data
		top -l 1 -pid $i | awk '{ print $0 }' >> memory_cpu_usage-$date.txt
		# echo "the mysqld has memory usage " $MEM " and cpu usage " $CPU "in process" $i
	done
			echo "generate a mysql_cpu_memory-date.txt report." 
			# get the number of your cpu and memory usage, if over certain %, call admin  

fi	

# If usage is high, find out the thread using command to show the associate threads within a givern process pidstat -t -p <mysqld_pid> 1
# After knowing which thread consumes the most CPU usage,choose the thread and explain it for improvement 
