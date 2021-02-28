#!/bin/bash


RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NOCOLOR='\033[0m'

source_folder="/tmp/files"
destination_folder="/home/$USER"

audio_files="mp3 ogg wav flac aac"
video_files="avi mp4 wmv mkv"
image_files="jpeg jpg gif png bmp"
document_files="txt ppt doc docx csv xls xlsx pdf"



echo "-- Audio files copy..."
for i in $audio_files
do
find $source_folder -type f -name "*.$i"  -exec mv -t $destination_folder/Music {} \;
    if [ $? -ne 0 ]
    then
    echo -e "${RED}ERROR - Error during the copy of Document files"
    exit 1
    fi
done
echo -e "${NOCOLOR}Audio Files Copy : ${GREEN}OKOK"

echo "-- Video files copy..."
for i in $video_files
do 
     find $source_folder -type f -name "*.$i" -exec mv -t $destination_folder/Videos {} \;
    if [ $? -ne 0 ]
    then
    echo -e "${RED}ERROR - Error during the copy of Document files"
    exit 1
    fi
done
echo -e "${NOCOLOR} Video Files Copy : ${GREEN}OK"


echo "-- Image files copy..."
for i in $image_files
do 
     find $source_folder -type f -name "*.$i" -exec mv -t $destination_folder/Pictures {} \;
    if [ $? -ne 0 ]
    then
    echo -e "${RED}ERROR - Error during the copy of Document files"
    exit 1
    fi
done
echo -e "${NOCOLOR} Image Files Copy : ${GREEN}OKOK"

echo "-- Document files copy..."
for i in $document_files
do 
    find $source_folder -type f -name "*.$i" -exec mv -t $destination_folder/Documents {} \;
    if [ $? -ne 0 ]
    then
    echo -e "${RED}ERROR - Error during the copy of Document files"
    exit 1
    fi
done
echo -e "${NOCOLOR}Document Files Copy : ${GREEN}OK"