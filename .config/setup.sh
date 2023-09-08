#!/bin/bash

# oh-my-zsh 
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/oh-my-zsh

# tmux 
mkdir -p ~/.config/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
tmux source ~/.config/tmux/tmux.conf
