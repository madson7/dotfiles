#!/usr/bin/env bash

sudo rm -rf /etc/sudoers.d/ || true
sudo mkdir -p /etc/sudoers.d/

sudo tee /etc/sudoers.d/$USER > /dev/null << EOF
# User rules for $USER
$USER ALL=(ALL) NOPASSWD:ALL
EOF

echo '#!/bin/bash' | sudo tee /usr/local/bin/apt-get
echo 'exec /usr/bin/apt-get --allow-downgrades "$@"' | sudo tee -a /usr/local/bin/apt-get
sudo chmod +x /usr/local/bin/apt-get

# # Docker e Docker Compose
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get autoremove -y

# Cria um arquivo temporário para armazenar a senha
VAULT_PASS_FILE=$(mktemp)
echo "$PASS_VAULT" > "$VAULT_PASS_FILE"

# ansible-vault encrypt
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.export_rc --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/zsh/.zshrc --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.alias_rc --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.biglinux-zsh-config --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.biglinux-zsh-prompt --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.function_rc --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/ssh/id_rsa --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/ssh/id_rsa.pub --vault-password-file "$VAULT_PASS_FILE" || true

rm "$VAULT_PASS_FILE"