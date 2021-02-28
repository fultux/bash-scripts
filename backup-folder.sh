#!/bin/bash
#Backup folder in another destination 
#Script based on Rsync. It assumes that rsync is already installed

if [ -z $1 ] || [ -z $2 ]
then
    echo "Mandatory parameter not present"
    echo -e "Usage $0 <source_folder> <destination_folder> (optional archive)(optional <remote_host>)"
    exit 1
fi
source_folder=$1
destination_folder=$2

if [ -z $3 ]
then
    tar -cvf $source_folder.tar $destination_folder
    rsync -az $source_folder/$source_folder.tar $destination_folder/
    if [ -f $destination_folder/$source_folder.tar ]
    then
        echo "Archive transfered"
        rm $source_folder/$source_folder.tar
    else 
        echo "Archive not transfered "
        exit 1
    fi
else
    remote_host=$3
    tar -cvf $source_folder.tar $destination_folder
    rsync -az $source_folder/$source_folder.tar $3:$source_folder/
    #Laziness
    echo "Please ensure that the file was transfered on the destination server"

fi








