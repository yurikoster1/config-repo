#!/bin/bash

# Check if Docker is installed
if command -v docker &>/dev/null; then
    echo "Docker is installed."
else
    echo "Docker is not installed. Skipping Docker-related commands."
    docker_installed=false
fi

# Check if Snap is installed
if command -v snap &>/dev/null; then
    echo "Snap is installed."
else
    echo "Snap is not installed. Skipping Snap-related commands."
    snap_installed=false
fi

# Check if Flatpak is installed
if command -v flatpak &>/dev/null; then
    echo "Flatpak is installed."
else
    echo "Flatpak is not installed. Skipping Flatpak-related commands."
    flatpak_installed=false
fi

# Check if Nix is installed
if command -v nix-env &>/dev/null; then
    echo "Nix is installed."
else
    echo "Nix is not installed. Skipping Nix-related commands."
    nix_installed=false
fi

# Clean package caches
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove



# Clean systemd journal logs
sudo journalctl --vacuum-time=2d; sudo journalctl --rotate

# Remove orphaned packages
sudo deborphan | xargs sudo apt-get -y remove --purge

# Update snaps, remove old snaps, and clean cache
if [ "$snap_installed" = true ]; then
    sudo snap refresh
    if command -v remove-old-snaps &>/dev/null; then
       sudo remove-old-snaps
    fi
    find /var/cache/snapd -mindepth 1 -delete -print 2>/dev/null || true
else
    echo "Snap is not installed. Skipping Snap-related commands."
fi

if command -v nala &>/dev/null; then
   # Update and upgrade using 'nala'
   sudo nala update && sudo nala upgrade -y
else
   sudo apt-get update && sudo apt-get upgrade -y
fi

# Docker-related commands (with checks)
if [ "$docker_installed" = true ]; then
    docker system prune --all --force --filter "until=168h"
    sudo docker system prune --volumes -f
    sudo docker network prune -f
    sudo docker volume prune -f
    sudo docker image prune -f
    sudo docker container prune -f
else
    echo "Docker is not installed. Skipping Docker-related commands."
fi

# Update all Flatpaks (with check)
if [ "$flatpak_installed" = true ]; then
    flatpak update -y
else
    echo "Flatpak is not installed. Skipping Flatpak-related commands."
fi

# Update Nix packages as root (with check)
if [ "$nix_installed" = true ]; then
    sudo nix-env -u
    nix-env -u
else
    echo "Nix is not installed. Skipping Nix-related commands."
fi

# Clean thumbnail cache and temporary files
find ~/.cache/thumbnails/ -type f -delete
find /tmp -mindepth 1 -delete -print 2>/dev/null || true

# Display disk space information
df -h
