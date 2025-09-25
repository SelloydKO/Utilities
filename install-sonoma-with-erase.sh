#!/bin/bash
# Created by Selloyd Fernandes

echo -e "\033c" 

diskutil erasedisk APFS untitled /dev/disk0

if [ -d "/Volumes/Image Volume" ]
then
  /Volumes/Image\ Volume/Install\ macOS\ Sonoma.app/Contents/Resources/startosinstall --agreetolicense --nointeraction
else
  echo "Volume - Install macOS Sonoma not found."
  echo "ignoring check to install sonoma"
  /Volumes/Install\ macOS\ Sonoma/Install\ macOS\ Sonoma.app/Contents/macOS/InstallAssistant 
fi

exit 0
