#!/bin/bash

SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)

for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add space space.$sid left                                    \
             --set space.$sid space=$sid                                    \
                              icon=$sid                                     \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.padding_right=14                        \
                              label.y_offset=-1                             \
                              script="$PLUGIN_DIR/space.sh"
done

sketchybar --add item space_separator left                             \
           --set space_separator icon="􀆊"                              \
                                 icon.color=$ACCENT_COLOR              \
                                 icon.padding_left=0                   \
                                 label.drawing=off                     \
                                 background.drawing=off                \
                                 script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator space_windows_change

# separator=(
#   icon=􀆊
#   icon.font="$FONT:Heavy:16.0"
#   padding_left=15
#   padding_right=15
#   label.drawing=off
#   associated_display=active
#   click_script='yabai -m space --create && sketchybar --trigger space_change'
#   icon.color=$WHITE
# )
#
# sketchybar --add bracket spaces '/space\..*/' \
#            --set spaces "${spaces[@]}"        \
