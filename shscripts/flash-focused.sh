#!/usr/bin/env zsh

# quickly fade out/in the focused window
/usr/local/bin/yabai -m window --opacity 0.6
sleep 0.2
/usr/local/bin/yabai -m window --opacity 1.0
