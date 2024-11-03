#!/bin/bash

TITLE="$(osascript -e 'tell application "Music" to get name of current track')"
ARTIST="$(osascript -e 'tell application "Music" to get artist of current track')"
osascript -e '
tell application "Music"
    if player state is playing then
        set currentTrack to current track
        set artworkData to data of artwork 1 of currentTrack
        set artworkFile to "/tmp/cover.jpg"
        set fileRef to (open for access POSIX file artworkFile with write permission)
        write artworkData to fileRef starting at 0
        close access fileRef
    end if
end tell'
COVER="/tmp/cover.jpg"

STATE=$(osascript -e "tell application \"Music\" to set playerState to (get player state) as text")
if [ "$STATE" = "playing" ]; then
  MEDIA="$TITLE x $ARTIST"
  sketchybar --set $NAME label="$MEDIA" drawing=on \
                         icon.background.image=$COVER
else
  sketchybar --set $NAME drawing=off
fi
