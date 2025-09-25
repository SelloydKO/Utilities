#!/bin/bash
# Created by Selloyd Fernandes

echo -e "\033c" 

diskutil erasedisk APFS untitled /dev/disk0

if [ -d "/Volumes/Install macOS Sonoma" ]
then
  /Volumes/Install\ macOS\ Sonoma/Install\ macOS\ Sonoma.app/Contents/macOS/InstallAssistant 
else
  echo "Image /Volumes/ESR/Install macOS Sonoma/ not found."
fi

exit 0
