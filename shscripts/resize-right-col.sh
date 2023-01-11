#!/usr/bin/env zsh

# get the current state of the focused window
floating=$(/usr/local/bin/yabai -m query --windows --window | /usr/local/bin/jq -re '."is-floating"')

# if the window is not floating
if [[ "$floating" = false ]]; then
  # toggle its float mode and resize it
  /usr/local/bin/yabai -m window --toggle float
  /usr/local/bin/yabai -m window --grid 1:4:3:0:2:1
else
  # simply resize the window
  /usr/local/bin/yabai -m window --grid 1:4:3:0:2:1
fi
