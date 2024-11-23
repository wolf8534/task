#!/bin/bash

# Update the apt package index
sudo apt-get update

# Install required packages for Docker installation
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the apt package index again
sudo apt-get update

# Install Docker
sudo apt-get install -y docker-ce

# Verify the installation
sudo docker --version

# Add the current user to the Docker group (optional but recommended)
sudo usermod -aG docker $USER

# Restart the Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Display Docker status
sudo systemctl status docker