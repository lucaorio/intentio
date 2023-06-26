#!/usr/bin/env zsh

# get the current state of the focused window
floating=$(/opt/homebrew/bin/yabai -m query --windows --window | /opt/homebrew/bin/jq -re '."is-floating"')
sticky=$(/opt/homebrew/bin/yabai -m query --windows --window | /opt/homebrew/bin/jq -re '."is-sticky"')

# if the window is not sticky...
if [[ "$sticky" = false ]]; then
  # toggle its sticky mode and place it on the top layer
  /opt/homebrew/bin/yabai -m window --toggle sticky --layer above
  # ...and if the window is not floating, make it so
  if [[ "$floating" = false ]]; then
    /opt/homebrew/bin/yabai -m window --toggle float
  fi
# otherwise, if the window is already sticky...
else
  # re-insert the window into bsp layout and restore the normal elevation
  /opt/homebrew/bin/yabai -m window --toggle sticky --layer normal
  if [[ "$floating" = true ]]; then
    /opt/homebrew/bin/yabai -m window --toggle float
  fi
fi
