#!/bin/bash


service=$1
service_state=`systemctl list-units --type=service | grep $service | awk '{print $4}'`

