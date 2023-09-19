#!/bin/bash
# Author             : Christo Deale
# Date	             : 2023-08-08
# networkdiscovery    : Utility to network discover active nodes

# Function to print text in red
print_red() {
    echo -e "\e[31m$1\e[0m"
}

# Ask the user for the IPv4 range to scan
print_red "Enter the IPv4 range to scan (e.g., 192.168.0): "
read -p "" IP_RANGE

# Define the range of host addresses to scan
START_HOST=1
END_HOST=255

# Loop through the IP range and ping each host
for ((host=$START_HOST; host<=$END_HOST; host++)); do
    IP_ADDRESS="$IP_RANGE.$host"
    ping -c 1 -W 1 "$IP_ADDRESS" >/dev/null 2>&1

    # Check the return code of the ping command
    if [[ $? -eq 0 ]]; then
        echo "Host $IP_ADDRESS is active."
    fi
done

# Ask the user if they want to quit the program
read -p "Do you want to quit the program? (y/n): " answer
if [[ $answer == "y" || $answer == "Y" ]]; then
    exit 0
fi
