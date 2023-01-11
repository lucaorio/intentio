#!/usr/bin/env zsh

# get the current state of the focused window
floating=$(/usr/local/bin/yabai -m query --windows --window | /usr/local/bin/jq -re '."is-floating"')
sticky=$(/usr/local/bin/yabai -m query --windows --window | /usr/local/bin/jq -re '."is-sticky"')

# if the window is not sticky...
if [[ "$sticky" = false ]]; then
  # toggle its sticky mode and place it on the top layer
  /usr/local/bin/yabai -m window --toggle sticky --layer above
  # ...and if the window is not floating, make it so
  if [[ "$floating" = false ]]; then
    /usr/local/bin/yabai -m window --toggle float
  fi
# otherwise, if the window is already sticky...
else
  # re-insert the window into bsp layout and restore the normal elevation
  /usr/local/bin/yabai -m window --toggle sticky --layer normal
  if [[ "$floating" = true ]]; then
    /usr/local/bin/yabai -m window --toggle float
  fi
fi
