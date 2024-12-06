#!/usr/bin/env bash

IN_VIDEO=$(select-file ~/Videos --title 'Select a video' --file-filter='Video files | *.mkv *.mp4')
if [ $? != 0 ]; then
    exit 1;
fi

OUT_AUDIO=$(select-file ~/Videos --title 'Save to audio' --file-filter='MP3 format | *.mp3' --save)
if [ $? != 0 ]; then
    exit 1;
fi

if kitty --title 'extract-audio-ffmpeg' ffmpeg -i "$IN_VIDEO" -vn "$OUT_AUDIO"; then
    notify-send -e "Audio successfully extracted!" --icon=applications-multimedia
else
    notify-send -e "Audio extraction failed." --icon=dialog-error
fi
