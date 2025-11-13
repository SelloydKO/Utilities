#!/bin/bash
# Created by Selloyd Fernandes

echo -e "\033c" 

diskutil erasedisk APFS untitled /dev/disk0

if [ -d "/Volumes/Image Volume" ]
then
  /Volumes/Image\ Volume/Install\ macOS\ Ventura.app/Contents/macOS/InstallAssistant 
else
  echo "Not booted into Install macOS Ventura. Will attempt to install via external"
  /Volumes/Install\ macOS\ Ventura/Install\ macOS\ Ventura.app/Contents/macOS/InstallAssistant 
fi

exit 0
