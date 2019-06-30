#!/bin/bash


#This is my sad excuse for a man page
usage() {
	echo "Usage: $0 [-z <string>] [-p <string>]" 1>&2;
	echo "-z	define a timezone file path from /usr/share/zoneinfo/ to use.";
	echo "	Default is UTC"
	echo "	see man date +%TZ for further Details";
	echo "";
	echo "-m	define a header message string as \"<Content of String>\"";
	exit 1;
	}

#predefining global variables for options
z="";
m="Die Uhr 2019";

#reading in the options
while getopts ":z:m:" o; do
    case "${o}" in
        z)
            z=${OPTARG}
            ;;
        m)
            m=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done


#Main loop for displaying the Time
for i in {1..999}
do
	if [ -z "$z" ];
	then
	#finding the zonefiles and picking a rnd one
		TZ=$(find /usr/share/zoneinfo/ -maxdepth 1 -type f | xargs file | awk -v FS='[/:]' '/timezone data, version 2/ {print $5}' | shuf -n 1)
	else
		#using the z as zone
		TZ=$z;
	fi
	#printing time
	clear;
	figlet -c $m;
	figlet $(TZ=$TZ date +'%T');
	##Exclude factory timezone
	if [ $(TZ=$TZ date +'%Z') != "-00" ];
	then
		figlet $(TZ=$TZ date +'%Z');
	else
		figlet $TZ;
	fi
	#echo $TZ;
	#wait until it is necessary to update clock
	sleep $(random -e 6 ; echo $(($? + 1)) )
done
