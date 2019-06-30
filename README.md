# DIEUHR

It cycles through the timezones.

It doesn't update every second, but only when it is necesssary.

#Usage
Usage: $0 [-z <string>] [-p <string>]"


#Options
	-z	define a timezone file path from /usr/share/zoneinfo/ to use.
		Default is UTC
		see man date +'%TZ' for further Details

	-m	define a header message string as "<Content of String>"

#Example

./dieuhr.sh -z localtime -m hello

will show hello and the current time as specified in the localtime Timezone file
