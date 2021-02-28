#!/bin/bash

source_folder="/tmp/files"
destination_folder="/home/$USER"

audio_files="mp3 ogg wav flac aac"
video_files="avi mp4 wmv mkv"
image_files="jpeg jpg gif png bmp"
document_files="txt ppt doc docx csv xls xlsx pdf"




for i in $audio_files
do
find $source_folder -type f -name "*.$i"
done


for i in $video_files
do 
     find $source_folder -type f -name "*.$i"
done


for i in $image_files
do 
     find $source_folder -type f -name "*.$i"
done


for i in $document_files
do 
    find $source_folder -type f -name "*.$i"
done