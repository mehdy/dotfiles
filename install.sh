#!/bin/zsh

ln -sf $PWD/root.gitignore ~/.gitignore
ln -sf $PWD/{.alacritty.toml,.vimrc,.zshrc,.extra.zsh,.tmux.conf,.gitconfig} ~/
ln -sf $PWD/{nvim,starship.toml} ~/.config/

if [[ `uname` == "Linux" ]]; then
	ln -sf $PWD/{hypr,uwsm,waybar,dunst,swayosd,rofi} ~/.config/

	# Session services, started with graphical-session.target under uwsm
	mkdir -p ~/.config/systemd/user
	ln -sf $PWD/systemd/swayosd.service ~/.config/systemd/user/
	systemctl --user daemon-reload
	systemctl --user enable hypridle hyprpaper waybar hyprpolkitagent cliphist gcr-ssh-agent.socket swayosd

	# Dark theme (persisted by dconf, so only needs setting once)
	gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"   # GTK3
	gsettings set org.gnome.desktop.interface color-scheme "prefer-dark" # GTK4
	gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"
	gsettings set org.gnome.desktop.interface cursor-size 24
fi

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
fi
