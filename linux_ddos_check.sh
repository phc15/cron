#!/bin/sh
notificationto=''
# show a list of IP which haved loggin is maximum time  using net static
# check all netstatic netstat -an of tcp udp print $5 cut -d [DELIMITER] -f [RANGE] [FILENAME] in the case field number 1(starting field) and delimiter is colon
# get it sorted use uniq -c to count the duplicate line and sort the output
netstat -an | grep 'tcp\|udp' | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
# get actual number
active_connection=$(netstat -an | grep 'tcp\|udp' | grep -i  ESTABLISHED | wc -l)
if [[ $active_connection -gt 1 ]]
then
	echo "current activate connection is $active_connection !"
else 
	echo "current network statistic is normal"
fi
# block the suspecious ip

# route add $IPADDRESS reject 
# iptables -A INPUT 1 -s $IPADDRESS -j DROP
# service iptables restart
# service iptables save

# cross check if the ip is blocked or not
# route -n |grep $IPADDRESS

# send email notification
echo date | mail -s "The server has potentional flood attck and active connection exceed $active_connection." $notificationto
