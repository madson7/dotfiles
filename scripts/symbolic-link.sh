#!/usr/bin/env bash

rm -fr ~/.zshrc || true
rm -fr ~/.gitconfig || true
rm -fr ~/.config-zsh || true
rm -fr ~/.ssh || true
mkdir -p ~/.config-zsh || true
mkdir -p ~/.ssh || true
sudo rm /etc/sysctl.conf || true
sudo rm /etc/wireguard/wg0.conf || true
sudo rm /etc/dnsmasq.conf || true
sudo rm /etc/resolv.conf || true
sudo rm ~/.docker/config.json || true

ln -s ${PWD}/config/zsh/.zshrc ~/.zshrc
ln -s ${PWD}/config/.gitconfig ~/.gitconfig
ln -s ${PWD}/config/zsh/config-zsh/.alias_rc ~/.config-zsh/.alias_rc
ln -s ${PWD}/config/zsh/config-zsh/.biglinux-zsh-config ~/.config-zsh/.biglinux-zsh-config
ln -s ${PWD}/config/zsh/config-zsh/.biglinux-zsh-prompt ~/.config-zsh/.biglinux-zsh-prompt
ln -s ${PWD}/config/zsh/config-zsh/.export_rc ~/.config-zsh/.export_rc
ln -s ${PWD}/config/zsh/config-zsh/.function_rc ~/.config-zsh/.function_rc
ln -s ${PWD}/config/ssh/id_rsa ~/.ssh/id_rsa
ln -s ${PWD}/config/ssh/id_rsa.pub ~/.ssh/id_rsa.pub
ln -s ${PWD}/config/sys/config.json ~/.docker/config.json
sudo ln -s ${PWD}/config/sys/sysctl.conf /etc/sysctl.conf
sudo ln -s ${PWD}/config/sys/wg0.conf /etc/wireguard/wg0.conf
sudo ln -s ${PWD}/config/sys/dnsmasq.conf /etc/dnsmasq.conf
sudo ln -s ${PWD}/config/sys/resolv.conf /etc/resolv.conf
