#!/bin/bash
echo -e "Enter username:"
read username

echo -e "Enter email contact:"
read email

if [ -z $username  ] || [ -z $email ]
then 
echo "Please enter a username AND an email"
exit 1
fi


passwd=`cat /etc/passwd | awk -F ":" '{print $1}'`


if [ "$username" == "$passwd | grep $username"  ]
then 
    echo "user already present"
else
    echo "user not present continue"
fi

#user create
#useradd -m -s /bin/bash -c "Account of user: $username - email: $email" $username

#Generate password
#pwgen -B -n -y -s -N 1 12