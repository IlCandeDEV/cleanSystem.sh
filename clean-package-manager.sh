#!/bin/bash

# Script made by IlCande 13/04/25
# Purpose: clean the sys pkg manager

# Color codes
BW='\e[1;37m'      # Bold White
RC='\e[0m'         # Reset Color

echo -e "${BW}➜ Cleaning pacman cache...${RC}"
sudo pacman -Scc
echo -e "${BW}➜ Pacman cache cleaned${RC}"

# Check for orphans pgk
ORPHANS=$(pacman -Qdtq)
if [ -n "$ORPHANS" ]; then
    echo -e "${BW}➜ Removing orphans packages...${RC}"
    sudo pacman -Rns $ORPHANS
    echo -e "${BW}➜ Removed all orphans packages${RC}"
else
    echo -e "${BW}➜ No orphan packages to remove${RC}"
fi

# Check for yay or paru
if command -v yay &> /dev/null; then
    echo -e "${BW}➜ Cleaning yay cache...${RC}"
    yay -Sc
    echo -e "${BW}➜ Yay cache cleaned${RC}"
elif command -v paru &> /dev/null; then
    echo -e "${BW}➜ Cleaning paru cache...${RC}"
    paru -Sc
    echo -e "${BW}➜ Paru cache cleaned${RC}"
else
    echo -e "${BW}➜ No AUR helper (yay/paru) found, skipping...${RC}"
fi

echo -e "${BW}➜ Removing all temp files...${RC}"
sudo rm -rf /tmp/*
echo -e "${BW}➜ Removed temp files${RC}"

echo -e "${BW}➜ Cleaning older sys journals...${RC}"
sudo journalctl --vacuum-time=7d
echo -e "${BW}➜ Sys journal cleaned, kept ≤7d${RC}"

echo "---------------------------------"
echo -e "${BW}✓ Done with all cleaning${RC}"

echo "Press any key to exit..."
read -n 1

