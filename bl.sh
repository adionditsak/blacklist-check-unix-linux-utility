#!/bin/bash

path=/root/bin/bl

ips=`cat $path/ips.txt`

for ip in $ips
do
  /usr/bin/bl $ip | grep blacklisted |awk {'print $2'} >> $path/blacklisted.txt
done

if [ -s $path/blacklisted.txt ] && [ -f $path/blacklisted.txt ];
    then `mail -r from@example.com -s "Blacklist check" to@example.com < $path/blacklisted.txt`
    mv $path/blacklisted.txt $path/blacklisted-`date +"%m-%d-%y"`.txt
fi