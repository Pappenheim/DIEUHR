!#/usr/bin/bash

for i in {1..999}
do
	#finding the zonefiles and picking a rnd one
	TZ=$(find /usr/share/zoneinfo/ -maxdepth 1 -type f | xargs file | awk -v FS='[/:]' '/timezone data, version 2/ {print $5}' | shuf -n 1)
	#printing time
	clear;
	figlet CWIX 2020;
	figlet $(TZ=$TZ date +'%T');
	##Exclude factory timezone
	if [ $(TZ=$TZ date +'%Z') != "-00" ];
	then
		figlet $(TZ=$TZ date +'%Z');
	else
		figlet $TZ;
	fi
	#wait until it is necessary to update clock
	sleep $(random -e 6 ; echo $(($? + 1)) )
done
