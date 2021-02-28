#!/bin/bash


RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NOCOLOR='\033[0m'

liste_fs_size=`df -h -x devtmpfs -x tmpfs | grep -v Filesystem | awk '{print $1","$5}' | tr -d "%"`

for i in $liste_fs_size
do
    fs_name=`echo "$i" | awk -F "," '{print $1}'`
    fs_usage=`echo "$i" | awk -F "," '{print $2}'`
    
    if [ $fs_usage -ge 90 ]
    then
        echo -e "${NOCOLOR}$fs_name: ${RED}KO - more than 95% space used."
    elif  [ $fs_usage -ge 80 ]
    then
        echo -e "${NOCOLOR}$fs_name: ${ORANGE}WARNING - more than 90% space used."
    else
        echo -e "${NOCOLOR}$fs_name: ${GREEN}OK"
    fi
done