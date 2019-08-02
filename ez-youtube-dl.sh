#!/usr/bin/env bash
# -*- coding: utf-8 -*- 

# download a youtube video as an mp4
# usage:
#       $  ./ez-youtube-dl.sh https://www.youtube.com/watch?v=siwpn14IE7E
#       $  ./ez-youtube-dl.sh https://www.youtube.com/watch?v=siwpn14IE7E [ ~/myoutputfolder/ ]
# @param URL => a youtube link
# @param OUTDIR => folder to save the output files

OUTPUT_FILENAME_FORMAT="%(title)s.%(ext)s"

# input URL is required @param
if [[ -z "$1" ]]; then
    (>&2 echo "ERROR: you must pass a youtube URL")
    exit 1
else
    URL="$1"
fi

# output OUTDIR is optional @param defaults to ~/data/youtube_dl/
if [[ -d "$2" ]]; then
    OUTDIR="$2"
else
    OUTDIR="$HOME/data/youtube_dl/"
fi

mkdir -p "$OUTDIR"

# fetch filename for video at a given URL and store it in variable so we have it later
OUTFILE="$(youtube-dl --get-filename -o "$OUTPUT_FILENAME_FORMAT" "$URL")"

youtube-dl \
    --output "$OUTDIR$OUTPUT_FILENAME_FORMAT" \
    --format 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
    "$URL"

echo -e "$OUTDIR$OUTFILE"

open -R "$OUTDIR$OUTFILE"
