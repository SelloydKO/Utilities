#!/bin/bash 

echo -e "\033c" 

diskutil erasedisk APFS u /dev/disk0

if [ -f "/Volumes/ESR/ES.dmg" ]
then
  asr -s "/Volumes/ESR/ES.dmg" -t "/Volumes/u" --noprompt --erase
  reboot
else
  echo "File /Volumes/ESR/ES.dmg not found, skipping."
fi

exit 0
