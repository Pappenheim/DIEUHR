# DIEUHR

It cycles through the timezones.

It doesn't update every second, but only when it is necesssary.

## Usage

Usage: ./dieuhr.sh [-z \<string\>] [-m \<string\>]


## Options

	-z	define a timezone file path from /usr/share/zoneinfo/ to use.
		Default is UTC.
		If this option isn't specified it will pick a RND timezone on every update.
		see man date +'%TZ' for further details.

	-m	define a header message string as "<Content of String>"

## Example

```
./dieuhr.sh -z localtime -m hello
```

will display hello and the current time as specified in the localtime timezone file


```
./dieuhr.sh -m WIEN -z Europe/Vienna -m WIEN

./dieuhr.sh -z CET -m WIEN
```

will display WIEN and the local time in Vienna

## Dependencies

relies on figlet to display Characters.
If you are having issues try

```
sudo apt-get update
sudo apt-get install figlet
```

