mkdir transcoded; for i in *.mp4; do ffmpeg -i "$i" -c:v dnxhd -profile:v dnxhr_sq -c:a pcm_s16le -f mov "transcoded/${i%.*}.mov"; done
