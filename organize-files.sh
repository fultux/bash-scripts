#!/bin/bash

source_folder="/tmp/files"
destination_folder="/home/$USER"

audio_files="mp3 ogg wav flac aac"
video_files="avi mp4 wmv mkv"
image_files="jpeg jpg gif png bmp"
document_files="txt ppt doc docx csv xls xlsx pdf"



echo "--copie des fichiers audio.."
for i in $audio_files
do
find $source_folder -type f -name "*.$i"  -exec mv -t $destination_folder {} ;
done

echo "--copie des fichiers vidéo.."
for i in $video_files
do 
     find $source_folder -type f -name "*.$i" -exec mv -t $destination_folder {} ;
done

echo "--copie des fichiers images.."
for i in $image_files
do 
     find $source_folder -type f -name "*.$i" -exec mv -t $destination_folder {} ;
done

echo "--copie des fichiers documents.."
for i in $document_files
do 
    find $source_folder -type f -name "*.$i" -exec mv -t $destination_folder {} ;
done