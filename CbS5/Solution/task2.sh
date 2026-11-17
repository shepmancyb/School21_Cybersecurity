#!/bin/bash
set -e   

if [ "$EUID" -ne 0 ]; then
    echo "Run the script as root"
    exit 1
fi

groupadd default_users
useradd -m -g default_users user

groupadd secret_users
useradd -m -g secret_users secret_agent
useradd -m -g secret_users secret_spy
useradd -m -g secret_users secret_boss

chmod 770 /home/secret_agent
chmod 770 /home/secret_spy
chmod 770 /home/secret_boss

chmod 777 /var

echo "%default_users ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

apt update
apt install -y apache2
systemctl start apache2
systemctl status apache2 --no-pager
