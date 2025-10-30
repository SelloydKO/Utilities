#!/bin/bash
# Created by Selloyd Fernandes

echo -e "\033c" 

diskutil erasedisk APFS untitled /dev/disk0

{
  /Volumes/Image\ Volume/Install\ macOS\ Sequoia.app/Contents/macOS/InstallAssistant 
} ||
{
  echo "Will attempt to install via external"
  /Volumes/Install\ macOS\ Sequoia/Install\ macOS\ Sequoia.app/Contents/macOS/InstallAssistant 
}

exit 0
