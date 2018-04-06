#!/bin/bash
clear
options_found=0
echo "                                                                                         "
echo "___  ____ ___     ____ ____ ____    ____ ____ _       ____ ____ ____ _  _ _  _ ____ ____ "
echo "|__] |__| |  \    |__| [__  [__     [__  [__  |       [__  |    |__| |\ | |\ | |___ |__/ "
echo "|__] |  | |__/    |  | ___] ___]    ___] ___] |___    ___] |___ |  | | \| | \| |___ |  \ "
echo "                                                                                         "
echo "                                                                                         "
echo "version 1.0.0"
echo "written by: Patrick Johns"
echo ""
echo "Script purpose: To perform an SSL Scan on a target list of IPs"

while getopts ":ht:o:p:" opt; do

	options_found=1

	case $opt in
		t)
			TARGET_FILE=${OPTARG}
			;;
		o)
			OUTPUT_FILE=${OPTARG}
			;;
		p)
			PORT=${OPTARG}
			;;
		h)
			echo "option: -t <target_file name.txt>"
			echo "option: -o <output_file name>"
			echo "option: -p port number"
			echo "option: -h help with options"
			exit 1
			;;
	esac
done

if ((!options_found));then
	echo ""
	echo "Please enter the appropriate options: -t -o -p -h"
	exit 0
fi

#appropriate ssl command execution below

for IP in $(cat $TARGET_FILE); do
sslscan --no-failed $IP:$PORT 2>&1 | tee -a $OUTPUT_FILE 
done
exit 0
