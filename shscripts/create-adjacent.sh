#!/usr/bin/env zsh

# get the index of the current space
index="$(/opt/homebrew/bin/yabai -m query --spaces | /opt/homebrew/bin/jq '.[] | select(."has-focus").index')"

# get the number of spaces
length="$(/opt/homebrew/bin/yabai -m query --spaces | /opt/homebrew/bin/jq 'length')"
diff=$(( length - index ))

# create the space
/opt/homebrew/bin/yabai -m space --create

# if the focused space is not the last one
if [ $diff -gt 0 ]; then
  # focus the newly created space...
  /opt/homebrew/bin/yabai -m space --focus last
  i=0
  # ...and move it next to the previously focused one
  while [ $i -lt $diff ]; do
    /opt/homebrew/bin/yabai -m space --move prev
    i=$(( i + 1 ))
  done
else
  # simply focus the newly created space
  /opt/homebrew/bin/yabai -m space --focus last
fi
