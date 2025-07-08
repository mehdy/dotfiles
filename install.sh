#!/bin/zsh

ln -sf $PWD/root.gitignore ~/.gitignore
ln -sf $PWD/{.alacritty.toml,.vimrc,.zshrc,.tmux.conf,.gitconfig} ~/
ln -sf $PWD/{nvim,starship.toml} ~/.config/

if [[ `uname` == "Linux" ]]; then
	ln -sf $PWD/{hypr,uwsm,waybar,dunst} ~/.config/
fi

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
fi
