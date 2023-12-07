#!/bin/bash

# Update package list
sudo apt -y update

# Install Squid
sudo apt -y install squid

# Edit Squid configuration file and add configuration
sudo sed -i '22i\dns_v4_first on' /etc/squid/squid.conf
sudo sed -i '23i\http_access allow all' /etc/squid/squid.conf

# Restart Squid service
sudo systemctl restart squid

# Enable Squid service to start on boot
sudo systemctl enable squid

# Install UFW (Uncomplicated Firewall)
sudo apt -y install ufw

# Allow traffic on port 3128
sudo ufw allow 3128/tcp

echo "Setup completed successfully."
