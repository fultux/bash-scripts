#!/bin/bash

source_folder=$1
destination_folder=$2

audio_files="mp3,ogg,wav,flac,aac"
video_files=" avi,mp4,wmv,mkv"
image_files="jpeg,jpg,gif,png,bmp"
document_files="txt,ppt,doc,docx,csv,xls,xlsx,pdf"


#Find audio video files
ls $source_folder *.{$audio_files}

#Find video files
ls $source_folder *.{$video_files}

#find image files
ls $source_folder *.{$image_files}

#Find document files
ls $source_folder *.{$document_files}