#!/bin/bash

#Uptime of the system
up=`uptime -p | tr -d up`
nbr_users=`uptime | awk -F "," '{ print $2 }'`


 echo "The system has been up since: ${up}"
 echo -e "Number of users currently logged in: ${nbr_users}"