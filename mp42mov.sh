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
 ffmpeg -i "$vid" -acodec pcm_s16le -vcodec copy "${noext// /_}.mov"
    mv "$vid" "$origdir"
done

for vid in *.MP4; do  
 noext="${vid%.MP4}"    
 ffmpeg -i "$vid" -acodec pcm_s16le -vcodec copy "${noext// /_}.mov"
    mv "$vid" "$origdir"
done
