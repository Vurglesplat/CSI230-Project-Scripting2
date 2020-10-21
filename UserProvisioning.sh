#!/bin/bash

# file UserProvisioning.sh
# brief generating passwords and an email to send to a list of recieved emails
# author brandon.boras
# date 10/20/2020




		# main program begins here

if [ "$EUID" -ne 0 ]; then
	echo "Must Run as Root"
	exit 1
else
	echo "Test message: You are root."
fi
exit 0

