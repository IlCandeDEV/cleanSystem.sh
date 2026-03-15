#!/bin/bash

# set-wal.sh
# Script for wallpaper setting and color scheme generator
# IlCandeDEV
# 14-03-2026

# Choosing wallpaper
# Using fd instead of find for a quicker search
WAL=$(fd . /nvme1n1/mywallpaper/ -t f -e jpg | shuf -n 1)

# Wallpaper setting
# Using AWWW
awww img $WAL --transition-type any --transition-fps 144 --transition-duration 1

# Color scheme generation
# Using Hellwal
hellwal -i $WAL --neon-mode --quiet
# Using Matugen
matugen image $WAL -t scheme-neutral -m dark --quiet