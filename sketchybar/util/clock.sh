#!/bin/bash

sketchybar --add item clock right \
           --set clock update_freq=30 \
                       icon.padding_left=0 \
                       icon.padding_right=0 \
                       label.padding_left=6 \
                       label.padding_right=6 \
                       click_script="$PLUGIN_DIR/zen.sh" \
                       script="$PLUGIN_DIR/clock.sh"

