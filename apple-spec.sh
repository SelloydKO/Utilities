#!/bin/bash 
# KOcycle Helper Script - get info for macs to fill out in Razor

# Reset terminal to keep things clean
tput reset

# Collect and format system information
{

    # Power and Hardware information
    echo -e "\033[1mBattery Info:\033[0m";
    system_profiler SPPowerDataType | grep -E "Maximum Capacity|Cycle Count|Condition|Processor";


    system_profiler SPHardwareDataType | grep -E "Serial Number|Chip|Cores|Memory";
    
    # Display information
    echo -e "\033[1mDisplay Info:\033[0m";
    system_profiler SPDisplaysDataType | grep -E "Chip|Type|Cores|Resolution";
    
    # Disk information
    echo -e "\033[1mDisk Info:\033[0m";
    diskutil info disk0 | grep "Disk Size";
    
    # Keyboard language
    echo -e "\033[1mKeyboard Info:\033[0m";
    ioreg -l | grep "KeyboardLanguage";

    # T2 info
    sysctl -n machdep.cpu.brand_string;

} | awk -F '[:=]' '{
    gsub(/^ +| +$/, "   ", $1);
    gsub(/^ +| +$/, "   ", $2);
    print $1 ":" $2;
}'


echo -e "Created by \033[1mSelloyd\033[0m"


exit 0
