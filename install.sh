#!/bin/zsh

ln -sf $PWD/root.gitignore ~/.gitignore
ln -sf $PWD/{.alacritty.toml,.vimrc,.zshrc,.extra.zsh,.tmux.conf,.gitconfig} ~/
ln -sf $PWD/{nvim,starship.toml} ~/.config/

if [[ `uname` == "Linux" ]]; then
	ln -sf $PWD/{hypr,uwsm,waybar,dunst} ~/.config/
	ln -sf $PWD/calendar_notificaiton_killer.zsh ~/.local/bin/

	# Session services, started with graphical-session.target under uwsm
	systemctl --user enable hypridle hyprpaper waybar hyprpolkitagent cliphist gcr-ssh-agent.socket

	# Dark theme (persisted by dconf, so only needs setting once)
	gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"   # GTK3
	gsettings set org.gnome.desktop.interface color-scheme "prefer-dark" # GTK4
fi

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
fi
