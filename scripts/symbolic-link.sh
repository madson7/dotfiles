#!/usr/bin/env bash

rm -fr ~/.zshrc
rm -fr ~/.config-zsh
rm -fr ~/.ssh
mkdir -p ~/.config-zsh
mkdir -p ~/.ssh
sudo rm /etc/sysctl.conf

ln -s ${PWD}/config/zsh/.zshrc ~/.zshrc
ln -s ${PWD}/config/zsh/config-zsh/.alias_rc ~/.config-zsh/.alias_rc
ln -s ${PWD}/config/zsh/config-zsh/.biglinux-zsh-config ~/.config-zsh/.biglinux-zsh-config
ln -s ${PWD}/config/zsh/config-zsh/.biglinux-zsh-prompt ~/.config-zsh/.biglinux-zsh-prompt
ln -s ${PWD}/config/zsh/config-zsh/.export_rc ~/.config-zsh/.export_rc
ln -s ${PWD}/config/zsh/config-zsh/.function_rc ~/.config-zsh/.function_rc
ln -s ${PWD}/config/ssh/id_rsa ~/.ssh/id_rsa
ln -s ${PWD}/config/ssh/id_rsa.pub ~/.ssh/id_rsa.pub
sudo ln -s ${PWD}/config/sys/sysctl.conf /etc/sysctl.conf