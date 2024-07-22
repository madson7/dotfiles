#!/usr/bin/env bash

sudo apt-get autoremove -y && \
    sudo apt-get clean -y

sudo rm /usr/local/bin/apt-get

neofetch
