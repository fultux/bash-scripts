#!/bin/bash
#Backup folder in another destination.
#Script based on Rsync. It assumes that rsync is already installed.
#Must be reworked.

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]
then
    echo "Mandatory parameter not present"
    echo -e "Usage $0 <source_folder> <destination_folder> <backup_name> (optional archive)(optional <remote_host>)"
    exit 1
fi


source_folder=$1
destination_folder=$2
backup_name=$3
date=`date +%F`


if [ -z $4 ]
then
    tar -cvf ${backup_name}_$date.tar $source_folder
    rsync -az ./${backup_name}_$date.tar $destination_folder/
    if [ -f ./${backup_name}_$date.tar ]
    then
        echo "Archive transfered"
        rm ./${backup_name}_$date.tar
    else 
        echo "Archive not transfered "
        exit 1
    fi
else
    remote_host=$4
    tar -cvf $source_folder.tar $source_folder
    rsync -az $source_folder/$source_folder.tar $3:$source_folder/
    #Laziness
    echo "Please ensure that the file was transfered on the destination server"

fi








