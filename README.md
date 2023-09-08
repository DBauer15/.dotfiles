# Dotfile Configs
Contains configs for various applications on unix-like systems. Assumes zsh as primary shell and that applications are installed prior to cloning the repository.

## Installation
Clone the repository to a new machine as a bare repository
```bash
git clone --bare https://github.com/DBauer15/.dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
bash $HOME/.config/setup.sh
```
