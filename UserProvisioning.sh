#!/bin/bash

# file UserProvisioning.sh
# brief generating passwords and an email to send to a list of recieved emails
# author brandon.boras
# date 10/20/2020

# *1 - https://stackoverflow.com/questions/47406014/how-to-cut-an-existing-variable-and-assign-to-a-new-variable-in-bash   needed this to figure out <<<
# *2 - https://www.howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/

		# main program begins here

if [ "$EUID" -ne 0 ]; then
	echo "Must Run as Root"
	exit 1
else
	if [ $@ ]; then
		if [[ -f "$1" ]]; then
			all_invalid=true
			cat ${1} | while read line
			do
				# *1
				username=$(cut -f 1 -d "@" <<<"$line")
				domain=$(cut -f 2 -d "@" <<<"$line")

				# *2
				pswd=$(openssl rand -base64 15)
				echo "Username: $username  | domain name: $domain | password: $pswd"

				useradd $username
				echo $username:${pswd} | chpasswd


#				passwd –-stdin "$pswd"

#				out=$(host -W1 -t A $line)
#				if [ $? -eq 0 ];then
#					ip=$(echo $out | cut -d " " -f 4)
#					email=$(cut -f 1 -d "@" $(line))
#					echo ${email}
#					echo ${line}
#					all_invalid=false
#				else
#					echo "${line},not found"
#				fi
			done
			
#			if $all_valid; then
#				echo "None of the hosts were valid"
#				exit 1
#			fi
		else
			echo "Something was passed, but it was not an email list"
			exit 1
		fi
	else
		echo "You need to pass an email list, nothing was passed"
		exit 1
	fi
fi
exit 0

