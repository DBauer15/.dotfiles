#!/bin/bash

# general
cd $HOME
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

# oh-my-zsh 
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/oh-my-zsh

# tmux 
mkdir -p ~/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
