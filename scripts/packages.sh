#!/usr/bin/env bash

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Instalando pacotes
sudo apt-get install -y \
    ansible \
    joystick jstest-gtk\
    apache2-utils \
    python3-pip \
    build-essential \
    curl \
    htop btop \
    firefox \
    git-flow \
    neofetch \
    nfs-common \
    openconnect \
    openssl \
    goaccess \
    wireguard \
    yamllint \
    peek \
    tree \
    ssh sshpass \
    unzip zip gzip unrar\
    vlc \
    zsh \
    httpie \
    mariadb-client

# # Docker e Docker Compose
# sudo VERSION=$DOCKER_VERSION sh -c "$(curl -fsSL https://get.docker.com)" --dry-run
# sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
#     sudo chmod +x /usr/local/bin/docker-compose && \
#     sudo usermod -aG docker $USER && \
#     sudo systemctl restart docker && \
#     newgrp docker

# # Oh my zsh
# sudo chsh -s $(which zsh)
# rm -fr ~/.oh-my-zsh || true
# yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# sudo snap install kubectl --classic
# sudo snap install helm --classic
# # sudo snap install dbeaver-ce --classic
