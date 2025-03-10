# Dotfile Configs
Contains configs for various applications on unix-like systems. Assumes zsh as primary shell and that applications are installed prior to cloning the repository.

## Installation
Clone the repository to a new machine as a bare repository
```bash
git clone --bare git@github.com:DBauer15/.dotfiles.git $HOME/.dotfiles
[ ! -f .zshrc ] || mv .zshrc .zshrc.before-dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
bash $HOME/.config/setup.sh
```

### Neovim
To finish neovim setup, run `nvim` and update the Packer packages by typing `:PackerSync`.

### Tmux
Load the updates tmux config by entering `tmux` and running `<ctrl>-<space> I` and `<ctrl>-<space> R`. 
