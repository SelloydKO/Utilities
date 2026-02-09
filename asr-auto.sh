#!/bin/bash
# Created by Selloyd Fernandes

inner_width=58
total_width=$((inner_width + 2))

# Top border
printf '%*s\n' "$total_width" '' | tr ' ' '*'

# Empty line (top padding)
printf '*%*s*\n' "$inner_width" ''

# Main title (perfectly centered)
title="Apple Software Restore"
title_len=${#title}
left_title=$(((inner_width - title_len) / 2))
printf '*%*s%s%*s*\n' "$left_title" '' "$title" "$left_title" ''

# Creator/subtitle (perfectly centered)
creator="- created by Selloyd Fernandes"
creator_len=${#creator}
left_creator=$(((inner_width - creator_len) / 2))
printf '*%*s%s%*s*\n' "$left_creator" '' "$creator" "$left_creator" ''

# Empty line (bottom padding)
printf '*%*s*\n' "$inner_width" ''

# Bottom border
printf '%*s\n' "$total_width" '' | tr ' ' '*'

echo -e "\033c" 

diskutil erasedisk APFS u /dev/disk0

if [ -d "/Volumes/u" ]
 then
  echo "Onwards to ASR"
  if [ -f "/Volumes/ESR/ES.dmg" ]
  then
    asr -s "/Volumes/ESR/ES.dmg" -t "/Volumes/u" --noprompt --erase
    reboot
  else
    echo "File /Volumes/ESR/ES.dmg not found, skipping."
  fi
else
  echo "Failed to wipe primary disk, reboot into internet recovery"
fi

exit 0
