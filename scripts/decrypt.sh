#!/usr/bin/env bash

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
