#!/bin/bash

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

apple_logo=(
  icon="􀣺"
  icon.font="Hack Nerd Font:Bold:16.0"
  icon.color=$WHITE
  padding_right=15
  label.drawing=off
  background.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
)

apple_prefs=(
  icon="􀣌"
  icon.font="Hack Nerd Font:Bold:16.0"
  label="Preferences"
  label.font="Hack Nerd Font:Bold:14.0"
  click_script="open -a 'System Preferences'; $POPUP_OFF"
)

apple_activity=(
  icon="􁊐"
  icon.font="Hack Nerd Font:Bold:16.0"
  label="Activity"
  label.font="Hack Nerd Font:Bold:14.0"
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

apple_lock=(
  icon="􀎡"
  icon.font="Hack Nerd Font:Bold:16.0"
  label="Screen Sleep"
  label.font="Hack Nerd Font:Bold:14.0"
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

sketchybar --add item apple.logo left                  \
           --set apple.logo "${apple_logo[@]}"         \
                                                       \
           --add item apple.prefs popup.apple.logo     \
           --set apple.prefs "${apple_prefs[@]}"       \
                                                       \
           --add item apple.activity popup.apple.logo  \
           --set apple.activity "${apple_activity[@]}" \
                                                       \
           --add item apple.lock popup.apple.logo      \
           --set apple.lock "${apple_lock[@]}"
