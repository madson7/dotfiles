#!/usr/bin/env bash

rm -fr ~/.zshrc
rm -fr ~/.config-zsh
mkdir -p ~/.config-zsh

ln -s ${PWD}/config/zsh/.zshrc ~/.zshrc
ln -s ${PWD}/config/zsh/config-zsh/.alias_rc ~/.config-zsh/.alias_rc
ln -s ${PWD}/config/zsh/config-zsh/.biglinux-zsh-config ~/.config-zsh/.biglinux-zsh-config
ln -s ${PWD}/config/zsh/config-zsh/.biglinux-zsh-prompt ~/.config-zsh/.biglinux-zsh-prompt
ln -s ${PWD}/config/zsh/config-zsh/.export_rc ~/.config-zsh/.export_rc
ln -s ${PWD}/config/zsh/config-zsh/.function_rc ~/.config-zsh/.function_rc
