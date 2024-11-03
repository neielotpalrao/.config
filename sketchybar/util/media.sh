#!/bin/bash

sketchybar --add item media center \
           --set media label.color=$ACCENT_COLOR \
                       label.max_chars=20 \
                       icon.padding_left=0 \
                       scroll_texts=on \
                       drawing=on \
                       icon.background.image.scale=0.03 \
                       icon.background.image.corner_radius=2 \
                       icon.background.drawing=on \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
