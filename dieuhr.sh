!#/usr/bin/bash

for i in {1..999}
do
	TZ=$(find /usr/share/zoneinfo/ -maxdepth 1 -type f | xargs file | awk -v FS='[/:]' '/timezone data, version 2/ {print $5}' | shuf -n 1)
	clear;
	figlet CWIX 2020;
	figlet $(TZ=$TZ date +'%T');
	if [ $(TZ=$TZ date +'%Z') != "-00" ];
	then
		#echo $TZ;
		#echo $(TZ=$TZ date +'%Z');
		figlet $(TZ=$TZ date +'%Z');
	else
		figlet $TZ;
	fi
	sleep $(random -e 6 ; echo $(($? + 1)) )
done
