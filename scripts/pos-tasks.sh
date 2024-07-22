#!/usr/bin/env bash

sudo apt-get autoremove -y && \
    sudo apt-get clean -y

sudo rm /usr/local/bin/apt-get

# Cria um arquivo temporário para armazenar a senha
VAULT_PASS_FILE=$(mktemp)
echo "$PASS_VAULT" > "$VAULT_PASS_FILE"

# ansible-vault encrypt
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.export_rc --vault-password-file "$VAULT_PASS_FILE"
ansible-vault decrypt ${PWD}/config/zsh/.zshrc --vault-password-file "$VAULT_PASS_FILE"
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.alias_rc --vault-password-file "$VAULT_PASS_FILE"
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.biglinux-zsh-config --vault-password-file "$VAULT_PASS_FILE"
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.biglinux-zsh-prompt --vault-password-file "$VAULT_PASS_FILE"
ansible-vault decrypt ${PWD}/config/zsh/config-zsh/.function_rc --vault-password-file "$VAULT_PASS_FILE"

rm "$VAULT_PASS_FILE"