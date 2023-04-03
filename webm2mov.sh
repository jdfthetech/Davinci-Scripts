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
 ffmpeg -i "$vid" -vf zscale=tin=smpte2084:min=bt2020nc:pin=bt2020:rin=tv:t=smpte2084:m=bt2020nc:p=bt2020:r=tv,zscale=t=linear:npl=100,format=gbrpf32le,zscale=p=bt709,tonemap=tonemap=hable:desat=0,zscale=t=bt709:m=bt709:r=tv,format=yuv420p -c:v libx264 -crf 15 -preset slower "${noext// /_}.mov"
    mv "$vid" "$origdir"
done
