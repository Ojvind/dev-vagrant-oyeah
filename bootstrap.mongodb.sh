#!/usr/bin/env bash


# Import the public key used by the package management system.
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

# Create a list file for MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Reload local package database
apt-get update

# Install the MongoDB packages
apt-get install -y mongodb-org

# Start MongoDB
systemctl start mongod

# Verify that MongoDB has started successfully
systemctl status mongod

# Ensure that MongoDB will start following a system reboot
systemctl enable mongod

# 
# mongod --bind_ip_all

# Enable remote access
# https://github.com/UnderGreen/ansible-role-mongodb/issues/109
# https://medium.com/@deepti7garg/vagrant-box-to-create-mongodb-and-use-it-from-a-webapp-in-the-host-machine-91acbf4ffe43
