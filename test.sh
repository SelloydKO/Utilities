#!/bin/bash 
# KOcycle Helper Script - get info for macs to fill out in Razor

# Reset terminal to keep things clean
tput reset

#variables
inner_width=58
total_width=$((inner_width + 2))
title="Apple full spec report"
creator="- created by Selloyd Fernandes"

# Top border
printf '%*s\n' "$total_width" '' | tr ' ' '*'

# Empty line (top padding)
printf '*%*s*\n' "$inner_width" ''

# Main title (perfectly centered)
title_len=${#title}
left_title=$(((inner_width - title_len) / 2))
printf '*%*s%s%*s*\n' "$left_title" '' "$title" "$left_title" ''

# Creator/subtitle (perfectly centered)
creator_len=${#creator}
left_creator=$(((inner_width - creator_len) / 2))
printf '*%*s%s%*s*\n' "$left_creator" '' "$creator" "$left_creator" ''

# Empty line (bottom padding)
printf '*%*s*\n' "$inner_width" ''

# Bottom border
printf '%*s\n' "$total_width" '' | tr ' ' '*'


# Collect and format system information
{

    # Power and Hardware information
    echo -e "\033[1mBattery Info:\033[0m";
    system_profiler SPPowerDataType | grep -E "Maximum Capacity|Cycle Count|Condition";


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


    cpu_brand=$(sysctl -n machdep.cpu.brand_string 2>/dev/null)
    if [[ "$cpu_brand" =~ ^Apple\ M ]]; then
    echo "This is an M-series MacBook.";
    elif [[ "$cpu_brand" =~ Intel ]]; then
    hardware_info=$(system_profiler SPHardwareDataType 2>/dev/null)
    if echo "$hardware_info" | grep -q "iBridge"; then
    {
        # T2 info
        echo "This is a T2 MacBook."
        echo -e "\033[1mT2 Info:\033[0m";
        sysctl -n machdep.cpu.brand_string;
        ioreg -l | grep -e "AppleRawCurrentCapacity" -e "AppleRawMaxCapacity"
    }
    else
    echo "This is an Intel MacBook without T2 chip."
    fi
    else
    echo "Unknown processor type."
    fi

} | awk -F '[:=]' '{
    gsub(/^ +| +$/, "   ", $1);
    gsub(/^ +| +$/, "   ", $2);
    print $1 ":" $2;
}'


echo -e "Created by \033[1mSelloyd\033[0m"


exit 0
