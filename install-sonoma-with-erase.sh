#!/bin/bash
# Created by Selloyd Fernandes

echo -e "\033c" 

diskutil erasedisk APFS untitled /dev/disk0

{
  /Volumes/Image\ Volume/Install\ macOS\ Sonoma.app/Contents/macOS/InstallAssistant 
} ||
{
  echo "Not booted into Install macOS Sonoma. Will attempt to install via external"
  /Volumes/Install\ macOS\ Sonoma/Install\ macOS\ Sonoma.app/Contents/macOS/InstallAssistant 
}

exit 0
