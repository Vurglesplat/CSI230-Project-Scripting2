# Progress Log
### General Overview
In general defiance of the much more reccomended gradual improvement of files over steady but gradual work, I prefer to work on my projects in massive chunks of time.
This is because I hate having to try and remember where I was and onboard myself with what I was doing much more than simply working on something for a larger chunk
of time. 
As a result of this There likely won't be more than 1 or 2 days spent on this project, so the general time of changes will be listed as well as the 
date to be more helpful. 

With that out of the way, on with the show.

initial checklist:
- [x] A github link to your script
- [x] A github link to your project notes in markdown format
  - [x] What internet sources did you use for each element of the pseudo code?
  - [x] Notes should have a chronology of your progress
- [ ] A googledoc link to your demonstration video where you demonstrate.
  - [ ] show the absence of accounts before the run
  - [ ] An e-mail script run using at least 3 student e-mails, including your instructor's email address .  Add this last so as not to irritate your instructor with spam during testing.
show a screenshot of one of the received e-mails (an account under your control)
  - [ ] test your login via ssh using the new credentials
  - [ ] you should be directed to change your password
  - [ ] do a repeat run using a single account already created
  - [ ] this should result in a simple password change
  - [ ] repeat the login process for that account.
  
 - [ ] extract a username by grabbing the text to the left of the @ delimiter
 - [ ] create a random password (openssl is great for this) of at least 12 characters
 - [ ] create a user account using the username, password, ensure that it has a home directory and that the default shell is bash.  Also make sure the user needs to change their password on first login (see the chage command).
 - [ ] Add each user to the CSI230 group (you will need to create this if it doesn't exist)
 - [ ] if the user already exists, update their password
 - [ ] send the user an e-mail with their initial username/password (google the following terms "send a gmail from bash 2fa")
 - [ ] Check for root user, if not root, Issue a warning and exit
 - [ ] This should run in one execution
 - [ ] There are multiple guides on sending emails to google via bash, see if you can avoid having your own email password stored and enter it interactively at run time.  Your password should be hidden on entry
 - [ ] You will also want to create the ability to remove the users you just added to facilitate testing, though this is not graded.





### 12:50 20 Oct 2020
Set up some additional emails to help with the rest as well as setting up this initial github, in a pretty good mood today so I'm confident I can plough through this,
hopefully won't be regretting these words later. Class soon so I'll be picking this up and really getting started later today, just used githubs own docs for reference 
to set these up, specifically [this page](https://docs.github.com/en/enterprise-server@2.20/github/writing-on-github/basic-writing-and-formatting-syntax())

### 21:22 20 Oct 2020
Added the base files and the bash script successfully checks for root. Recycled code from lab 6.2 to check and read through a passed file.
Used [a Stack Overflow page](https://stackoverflow.com/questions/47406014/how-to-cut-an-existing-variable-and-assign-to-a-new-variable-in-bash) for help to get cut working.
 - [x] Check for root user, if not root, Issue a warning and exit
 - [x] extract a username by grabbing the text to the left of the @ delimiter

### 00:10 21 Oct 2020
Generated and stored random password with openssl courtesy of a little help from [a How-To Geek page](https://www.howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/)

 - [x] create a random password (openssl is great for this) of at least 12 characters

### 01:19 21 Oct 2020
Implemented the pasword change, utlized [this Stack Exchange page](https://unix.stackexchange.com/questions/419063/how-to-create-user-and-password-in-one-script-for-100-users) to for help handling changing a password via script.
Implemented a check for the home directory being created.
Implemented forcing user to change account password on login.
Implemented changing the user's default shell to bash.
This was a really long single checkmark, looks like the lion's share is done so far, I'll probably head off for now and finish tomorrow morning.

 - [x] create a user account using the username, password, ensure that it has a home directory and that the default shell is bash.  Also make sure the user needs to change their password on first login (see the chage command).


#### Things to do checklist (updated over time)
- [ ] A googledoc link to your demonstration video where you demonstrate.
  - [ ] show the absence of accounts before the run
  - [ ] An e-mail script run using at least 3 student e-mails, including your instructor's email address .  Add this last so as not to irritate your instructor with spam during testing.
show a screenshot of one of the received e-mails (an account under your control)
  - [ ] test your login via ssh using the new credentials
  - [ ] you should be directed to change your password
  - [ ] do a repeat run using a single account already created
  - [ ] this should result in a simple password change
  - [ ] repeat the login process for that account.
  

 - [ ] Add each user to the CSI230 group (you will need to create this if it doesn't exist)
 - [ ] if the user already exists, update their password
 - [ ] send the user an e-mail with their initial username/password (google the following terms "send a gmail from bash 2fa")
 - [ ] This should run in one execution
 - [ ] There are multiple guides on sending emails to google via bash, see if you can avoid having your own email password stored and enter it interactively at run time.  Your password should be hidden on entry
 - [ ] You will also want to create the ability to remove the users you just added to facilitate testing, though this is not graded.
