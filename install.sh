#!/bin/zsh

ln -sf $PWD/{.alacritty.toml,.vimrc,.zshrc,.tmux.conf,.gitconfig} ~/
ln -sf $PWD/starship.toml ~/.config/
ln -sf $PWD/nvim ~/.config/
ln -sf $PWD/hypr/ ~/.config/

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
fi
