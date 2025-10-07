#!/bin/bash
# Created by Selloyd Fernandes

echo -e "\033c" 

diskutil erasedisk APFS untitled /dev/disk0

if [ -e "/Volumes/Image\ Volume/" ]
then
  /Volumes/Image\ Volume/Install\ macOS\ Sonoma.app/Contents/macOS/InstallAssistant 
else
  echo "Not booted into Install macOS Sonoma. Will attempt to install via external"
  /Volumes/Install\ macOS\ Sonoma/Install\ macOS\ Sonoma.app/Contents/macOS/InstallAssistant 
fi

exit 0
