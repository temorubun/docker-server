#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt-get update -y

# Install dependencies
echo "Installing dependencies..."
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker's official GPG key
echo "Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable repository
echo "Setting up Docker repository..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update package list again after adding Docker repository
echo "Updating package list again..."
sudo apt-get update -y

# Install Docker
echo "Installing Docker..."
sudo apt-get install docker-ce -y

# Check Docker status
echo "Checking Docker service status..."
sudo systemctl status docker

# Allow Docker to run without sudo (optional)
echo "Adding user to Docker group..."
sudo usermod -aG docker $USER

# Print Docker version to verify installation
echo "Docker installation complete. Checking Docker version..."
docker --version

echo "Docker setup completed successfully!"
