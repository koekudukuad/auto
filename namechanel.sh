#!/bin/bash
# Direktori tempat video disimpan
#gantisesuaifolder
VIDEO_DIR="/data/"
# Tentukan nama file video
VIDEO_FILES=(
"file1.mp4"
"file2.mp4"


    # Tambahkan lebih banyak file sesuai kebutuhan
)
# Hitung jumlah file di dalam array
TOTAL_FILES=${#VIDEO_FILES[@]}

# Dapatkan hari saat ini dalam siklus jumlah file
DAY_INDEX=$(( $(date +%s) / 86400 % TOTAL_FILES ))

# Pilih video berdasarkan DAY_INDEX
INPUT="$VIDEO_DIR/${VIDEO_FILES[$DAY_INDEX]}"

# URL RTMP YouTube dengan Stream Key
URL="rtmp://a.rtmp.youtube.com/live2/key"
# Command ffmpeg untuk streaming

#nohup /usr/local/bin/ffmpeg -stream_loop -1 -t 17:59:00 -re -i "$INPUT" \
nohup /usr/local/bin/ffmpeg -stream_loop -1 -t 17:59:00 -re -i "$INPUT" \
-c:v copy -c:a copy -r 30 -b:v 800k -bufsize 1600k \
-flvflags no_duration_filesize -f flv "$URL" > /data/live.log 2>&1 &
