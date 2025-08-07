
echo -e "\033c" && [ -f "/Volumes/ESR/ES.dmg" ] && asr -s "/Volumes/ESR/ES.dmg" -t "/Volumes/u" --noprompt --erase && reboot || echo "File /Volumes/ESR/ES.dmg not found, skipping."
