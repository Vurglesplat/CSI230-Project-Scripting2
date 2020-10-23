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
				emailMessage="null"

	
				# checking that a user exists
				if id -u $username &>/dev/null; then
					emailMessage="Hello,

					This account already exists, your password has been reassigned to: $pswd"

				else # creating user
					# create a user and use the generated password as their's
					useradd $username
					echo $username:${pswd} | chpasswd

					#create a home directory and check that it was made
					sudo mkhomedir_helper $username
					if [ ! -d "/home/${username}/" ]; then
						echo "Home directory was not created at /home/${username}/"
						exit 1;
					fi
					
					#ensure bash is the default shell
					sudo usermod --shell /bin/bash $username


					/bin/id -g "CSI230" 1>/dev/null 2>/dev/null
					if [ ! $? -eq 0 ]; then # if the group CSI230 is not found
						sudo groupadd -f CSI230
					fi


					sudo usermod -a -G CSI230 $username

					emailMessage="Hello,

					An account has been made for this email address, you will need to change your password when you log in.

					Username: $username
					Password: $pswd

					Thank you for your time,
					Brandon Boras"
				fi
				

				sendmail $line <<< ${emailMessage}
				# forcing a password change
				sudo chage --lastday 0 $username

			done
			
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


