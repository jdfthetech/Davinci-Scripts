#!/bin/bash

echo input video name: 
read video

ffmpeg -i $video -vn -acodec flac ${video%.*}.flac
