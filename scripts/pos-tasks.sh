#!/usr/bin/env bash

sudo sysctl -p

sudo apt-get autoremove -y && \
    sudo apt-get clean -y

sudo rm /usr/local/bin/apt-get

neofetch
