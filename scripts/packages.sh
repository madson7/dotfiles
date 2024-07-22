#!/usr/bin/env bash

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Instalando pacotes
sudo apt-get install -y \
    zsh \
    git-flow \
    openconnect \
    unzip \
    firefox \
    neofetch

# Docker e Docker Compose
sudo VERSION=$DOCKER_VERSION sh -c "$(curl -fsSL https://get.docker.com)" --dry-run
sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
    sudo chmod +x /usr/local/bin/docker-compose && \
    sudo usermod -aG docker $USER && \
    sudo systemctl restart docker && \
    newgrp docker

# Oh my zsh
rm -fr ~/.oh-my-zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
