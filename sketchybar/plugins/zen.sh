#!/bin/bash

# TODO: Set the values right and add this as clickup_script in clock.sh

zen_on() {
  sketchybar --set apple.logo drawing=off \
             --set space_separator drawing=off \
             --set front_app drawing=off \
             --set volume drawing=off \
             --set brew drawing=off
             # --set '/cpu.*/' drawing=off \
}

zen_off() {
  sketchybar --set apple.logo drawing=on \
             --set space_separator drawing=on \
             --set front_app drawing=on \
             --set volume drawing=on \
             --set brew drawing=on
             # --set '/cpu.*/' drawing=on \
}

if [ "$1" = "on" ]; then
  zen_on
elif [ "$1" = "off" ]; then
  zen_off
else
  if [ "$(sketchybar --query apple.logo | jq -r ".geometry.drawing")" = "on" ]; then
    zen_on
  else
    zen_off
  fi
fi
