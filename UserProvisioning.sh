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
	if [ $@ ]; then
		if [[ -f "$1" ]]; then
			all_invalid=true
			cat ${1} | while read line
			do
				username=$(cut -f 1 -d "@" <<<"$line")
				domain=$(cut -f 2 -d "@" <<<"$line")

				pswd=$(openssl rand -base64 13)
				echo "Username: $username  | domain name: $domain | password: $pswd"

				useradd $username
				echo $username:${pswd} | chpasswd
				sudo mkhomedir_helper $username
				if [ ! -d "/home/${username}/" ]; then
					echo "Home directory was not created at /home/${username}/"
					exit 1;
				fi
				
#				echo $(cut -f 7 -d ":" <<<$(cat /etc/passwd | grep $username))
				sudo usermod --shell /bin/bash $username

				sudo chage --lastday 0 $username


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


