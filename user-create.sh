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


username_present=`cat /etc/passwd | awk -F ":" '{print $1}' | grep $username`

if [ "$username" == "${username_present}"  ]
then 
    echo "user already present"
    exit 1
else
    echo "user not present continue"
    #user create
    useradd -m -s /bin/bash -c "$username - email: $email" $username

    #Generate password
    password=`pwgen -B -n -y -s -N 1 12`
    echo -e "$password\n$password" | passwd $username
    passwd -e $username


    echo "Account created."
    echo -e "Username: $username"
    echo -e "Password: $password"
    echo -e "Password must be changed after the first connexion."


fi

