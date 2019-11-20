#!/usr/bin/env bash

#  -f, --force           ignore nonexistent files and arguments, never prompt
sudo rm -f /etc/pacman.conf
sudo rm -f /etc/pacman.d/mirrorlist
sudo rm -f /etc/pacman.d/blackarch-mirrorlist

sudo ln -s $HOME/.config/pacman/pacman.conf /etc/pacman.conf
sudo ln -s $HOME/.config/pacman/mirrorlist /etc/pacman.d/mirrorlist
sudo ln -s $HOME/.config/pacman/blackarch-mirrorlist /etc/pacman.d/blackarch-mirrorlist