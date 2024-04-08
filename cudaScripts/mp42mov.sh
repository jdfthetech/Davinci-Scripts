set -e
origdir="./original"
shopt -s extglob nullglob

if [ ! -d "$origdir" ];
then
    echo "Creating $origdir directory."
    mkdir "$origdir"
fi

for vid in *.mp4; do  
 noext="${vid%.mp4}"    
 ffmpeg -y -hwaccel cuda -hwaccel_output_format cuda -i "$vid" -c:v h264_nvenc -b:v 5M -acodec pcm_s16le "${noext// /_}.mov"
    mv "$vid" "$origdir"
done

for vid in *.MP4; do  
 noext="${vid%.MP4}"    
 ffmpeg -y -hwaccel cuda -hwaccel_output_format cuda -i "$vid" -c:v h264_nvenc -b:v 5M -acodec pcm_s16le "${noext// /_}.mov"
    mv "$vid" "$origdir"
done
