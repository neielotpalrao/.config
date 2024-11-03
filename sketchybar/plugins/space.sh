#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

if [ $SELECTED = true ]; then
  sketchybar --set $NAME background.drawing=on \
                         background.color=$ACCENT_COLOR \
                         label.color=$BAR_COLOR \
                         icon.color=$BAR_COLOR
else
  sketchybar --set $NAME background.drawing=off \
                         label.color=$ACCENT_COLOR \
                         icon.color=$ACCENT_COLOR
fi

# update() {
#   WIDTH="dynamic"
#   if [ "$SELECTED" = "true" ]; then
#     WIDTH="0"
#   fi
#
#   sketchybar --animate tanh 20 --set $NAME icon.highlight=$SELECTED label.width=$WIDTH
# }
#
# mouse_clicked() {
#   if [ "$BUTTON" = "right" ]; then
#     yabai -m space --destroy $SID
#     sketchybar --trigger space_change --trigger windows_on_spaces
#   else
#     yabai -m space --focus $SID 2>/dev/null
#   fi
# }
#
# case "$SENDER" in
#   "mouse.clicked") mouse_clicked
#   ;;
#   *) update
#   ;;
# esac
