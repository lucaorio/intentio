#!/usr/bin/env zsh

# get the index of the current space...
index="$(/usr/local/bin/yabai -m query --spaces | /usr/local/bin/jq '.[] | select(."has-focus").index')"

# ...if it's greater than one jump to the previous space, otherwise jump to the next one
if [ $index -gt 1 ]; then
  /usr/local/bin/yabai -m space --focus prev
else
  /usr/local/bin/yabai -m space --focus next
fi

# delete the space that was focused before the switch
/usr/local/bin/yabai -m space "${index}" --destroy
