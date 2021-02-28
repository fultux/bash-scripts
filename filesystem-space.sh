#!/bin/bash


liste_fs_size=`df -h -x devtmpfs -x tmpfs | grep -v Filesystem | awk '{print $1","$5}' | tr -d "%"`

for i in $liste_fs_size
do
    fs_name=`echo "$i" | awk -F "," '{print $1}'`
    fs_usage=`echo "$i" | awk -F "," '{print $2}'`
    
    if [ $fs_usage -ge 90 ]
    then 
        echo "$fs_name: $(tput setaf 1) KO - more than 90% space used."
    else
        echo "$fs_name: $(tput setaf 2) OK"
    fi
done