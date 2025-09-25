#!/bin/bash
# Created by Selloyd Fernandes

echo -e "\033c" 

diskutil erasedisk APFS untitled /dev/disk0

if [ -d "/Volumes/Install\ macOS\ Sonoma/Install" ]
then
  /Volumes/Install\ macOS\ Sonoma/Install\ macOS\ Sonoma.app/Contents/macOS/InstallAssistant 
else
  echo "Volume - Install macOS Sonoma not found."
fi

exit 0
