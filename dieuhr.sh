#!/bin/bash


#This is my sad excuse for a man page
usage() {
	echo "Usage: $0 [-z <string>] [-m <string>]" 1>&2;
	echo "-z	define a timezone file path from /usr/share/zoneinfo/ to use.";
	echo "	Default is UTC"
	echo "	see man date +'%Z' for further Details";
	echo "";
	echo "-m	define a header message string as \"<Content of String>\"";
	echo "	Default is \"Die Uhr\""
	exit 1;
	}

#predefining global variables to default for options
HEADER="Die Uhr";
SYSTEMTIMEZONES=$(find /usr/share/zoneinfo/ -maxdepth 1 -type f)

#reading in the options
while getopts ":z:m:" o; do
    case "${o}" in
        z)
            TIMEZONE=${OPTARG}
            ;;
        m)
            HEADER=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

if [[ ! -z $TIMEZONE ]];
then
	if [[ "${SYSTEMTIMEZONES[*]}" == *"${TIMEZONE}"* ]];
	then
		FIXEDTZ=true
	else
		figlet "Timezone not found falling back to extreme RANDOMNESS"
		sleep $(( $RANDOM % 7 +1));
	fi
fi

#Main loop for displaying the Time
while true
do
	if [[ -z $FIXEDTZ ]];
	then
		#finding the zonefiles and picking a rnd one
		TIMEZONE=$(echo ${SYSTEMTIMEZONES[@]} | xargs file | awk -v FS='[/:]' '/timezone data, version 2/ {print $5}' | shuf -n 1)
	fi
	#printing time
	clear;
	figlet -c $HEADER;
	figlet $(TZ=$TIMEZONE date +'%T');
	figlet $(TZ=$TIMEZONE date +'%Z');

	#wait until it is necessary to update clock
	sleep $(( $RANDOM % 7 +1));
done
