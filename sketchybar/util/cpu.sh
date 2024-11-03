#!/bin/bash

sketchybar -m --add item cpu_label right \
              --set cpu_label label.font="Hack Nerd Font:Bold:6.0" \
                    label=CPU \
                    y_offset=6 \
                    width=0 \
                    label.padding_left=0 \
                    label.padding_right=8 \
              --add item cpu_percent right \
              --set cpu_percent label.font="Hack Nerd Font:Bold:10.0" \
                    background.height=10 \
                    y_offset=-4 \
                    icon.padding_left=0 \
                    icon.padding_right=4 \
                    label.padding_left=0 \
                    label.padding_right=4 \
                    update_freq=1 \
                    script="$PLUGIN_DIR/cpu.sh"

# cpu_top=(
#   label.font="Hack Nerd Font:Bold:6.0"
#   label=CPU
#   icon.drawing=off
#   width=0
#   padding_right=15
#   y_offset=6
# )
#
# cpu_percent=(
#   label.font="Hack Nerd Font:Bold:10.0"
#   label=CPU
#   y_offset=-4
#   padding_right=15
#   width=55
#   icon.drawing=off
#   update_freq=2
#   mach_helper="$HELPER"
# )
#
# cpu_sys=(
#   width=0
#   graph.color=$RED
#   graph.fill_color=$RED
#   label.drawing=off
#   icon.drawing=off
#   background.height=10
#   background.drawing=on
#   background.color=$TRANSPARENT
# )
#
# cpu_user=(
#   graph.color=$BLUE
#   label.drawing=off
#   icon.drawing=off
#   background.height=10
#   background.drawing=on
#   background.color=$TRANSPARENT
# )
#
# sketchybar --add item cpu.top right              \
#            --set cpu.top "${cpu_top[@]}"         \
#                                                  \
#            --add item cpu.percent right          \
#            --set cpu.percent "${cpu_percent[@]}" \
#                                                  \
#            --add graph cpu.sys right 75          \
#            --set cpu.sys "${cpu_sys[@]}"         \
#                                                  \
#            --add graph cpu.user right 75         \
#            --set cpu.user "${cpu_user[@]}"
