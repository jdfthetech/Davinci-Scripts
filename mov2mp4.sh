set -e
movdir="./mov"
shopt -s extglob nullglob

if [ ! -d "$movdir" ];
then
    echo "Creating $movdir directory."
    mkdir "$movdir"
fi

for vid in *.mov; do  
 noext="${vid%.mov}"    
# ffmpeg -y -hwaccel cuda -hwaccel_output_format cuda -i "$vid" -c:v h264_nvenc -b:v 5M -acodec pcm_s16le -cq 20 "${noext// /_}.mp4"

# use AAC audio:

 ffmpeg -y -hwaccel cuda -hwaccel_output_format cuda -i "$vid" -c:v h264_nvenc -b:v 5M -acodec aac -cq 20 "${noext// /_}.mp4" 
 
 
    mv "$vid" "$movdir"
done
