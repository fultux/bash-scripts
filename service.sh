#!/bin/bash

if [ -z $1 ]
then
    echo "no parameter provided"
    echo -e "usage: service.sh <service_name>"
    exit 1
else
    service=$1
    service_state=`systemctl list-units --type=service | grep $service | awk '{print $4}'`
    echo "The service ${service} has the state: ${service_state}"
    exit 0
fi