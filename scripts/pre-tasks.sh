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

curl -s -k https://gitlab.devops.decea.intraer/-/snippets/7/raw/main/decea-intraer.crt -o /tmp/decea-intraer.crt && \
    curl -s -k https://gitlab.ramos.intra.net/-/snippets/6/raw/main/ramos.intra.net.crt -o /tmp/ramos.intra.net.crt && \
    sudo mv /tmp/decea-intraer.crt /usr/local/share/ca-certificates/decea_rootca.crt && \
    sudo mv /tmp/ramos.intra.net.crt /usr/local/share/ca-certificates/ramos_rootca.crt && \
    sudo update-ca-certificates

# # Docker e Docker Compose
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Add the repository to sources.list.d windsurf stable codeiumdata
curl -fsSL "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/windsurf-stable-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null

sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get autoremove -y

# Cria um arquivo temporário para armazenar a senha
VAULT_PASS_FILE=$(mktemp)
echo "$PASS_VAULT" > "$VAULT_PASS_FILE"

# ansible-vault decrypt
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.export_rc --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/zsh/.zshrc --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.alias_rc --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.biglinux-zsh-config --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.biglinux-zsh-prompt --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.function_rc --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/ssh/id_rsa --vault-password-file "$VAULT_PASS_FILE" || true
ansible-vault decrypt ${PWD}/config/ssh/id_rsa.pub --vault-password-file "$VAULT_PASS_FILE" || true

rm "$VAULT_PASS_FILE"