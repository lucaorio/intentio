#!/usr/bin/env zsh

# get the current state of the focused window
floating=$(/opt/homebrew/bin/yabai -m query --windows --window | /opt/homebrew/bin/jq -re '."is-floating"')

# if the window is not floating
if [[ "$floating" = false ]]; then
  # toggle its float mode and resize it
  /opt/homebrew/bin/yabai -m window --toggle float
  /opt/homebrew/bin/yabai -m window --grid 2:2:0:0:2:2
else
  # simply resize the window
  /opt/homebrew/bin/yabai -m window --grid 2:2:0:0:2:2
fi
