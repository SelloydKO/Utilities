#!/bin/bash
# Created by Selloyd Fernandes

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
  echo "Failed to wipe primary disk"
fi

exit 0
