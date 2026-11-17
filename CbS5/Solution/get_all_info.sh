#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Run the script as root: sudo ./get_all_info.sh"
    exit 1
fi

apt update
apt install -y cowsay sl

echo "=== Kernel ===" > info
uname -a >> info
cat /etc/os-release >> info

echo "=== Packets  ===" >> info
dpkg -l >> info

echo "=== Processes ===" >> info
ps aux >> info

echo "=== Ports ===" >> info
ss -tulpn >> info

tar -cf OS_RESULT.tar info
