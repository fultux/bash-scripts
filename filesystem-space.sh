#!/bin/bash


liste_fs_size=`df -h -x devtmpfs -x tmpfs | grep -v Filesystem | awk '{print $1","$5}' | tr -d "%"`

for i in $liste_fs_size
do
    fs_name=`$i | awk -F "," '{print $1}'`
    fs_usage=`$i | awk -F "," '{print $2}'`
    
    if [ $fs_usage >= 90 ]
    then 
        echo "$fs_name usage has reach space limit"
    else
        echo "everything is fine"
    fi
done