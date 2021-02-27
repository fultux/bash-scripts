#!/bin/bash

fs_list_full=`df -h -x devtmpfs -x tmpfs | grep -v Filesystem`
for i in $fs_list_full 
do
    fs_usage=`$i | awk '{print $5}'  | tr -d "%"`
    fs_name= `$i | awk '{print $1}'`
    if [ $fs_usage >= 90 ]
    then 
        echo "$fs_name usage has reach space limit"
    else
        echo "everything is fine"
    fi
done