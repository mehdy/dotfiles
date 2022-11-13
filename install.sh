#!/bin/zsh

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
fi

ln -sf $PWD/{.alacritty.yml,.vimrc,.zshrc,.tmux.conf} ~/
ln -sf $PWD/starship.toml ~/.config/
ln -sf $PWD/nvim ~/.config/
