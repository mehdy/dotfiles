#!/bin/zsh
# Link the dotfiles into place. Safe to re-run from anywhere: correct links are
# left alone, and anything else in the way is moved to <name>.bak.<timestamp>.
# Packages: sudo pacman -S --needed - < packages.txt

DOTFILES=${0:A:h}

# <path in repo>  <destination, relative to $HOME>
links=(
	root.gitignore  .gitignore
	.alacritty.toml .alacritty.toml
	.zshrc          .zshrc
	.tmux.conf      .tmux.conf
	.gitconfig      .gitconfig
	nvim            .config/nvim
	starship.toml   .config/starship.toml
	hypr            .config/hypr
	uwsm            .config/uwsm
	waybar          .config/waybar
	dunst           .config/dunst
	swayosd         .config/swayosd
	rofi            .config/rofi
)

for src dst in $links; do
	src=$DOTFILES/$src dst=$HOME/$dst
	[[ -L $dst && $(readlink $dst) == $src ]] && continue
	if [[ -L $dst ]]; then
		rm $dst
	elif [[ -e $dst ]]; then
		mv $dst $dst.bak.$(date +%Y%m%d%H%M%S) && echo "moved existing $dst to $dst.bak.*"
	fi
	mkdir -p ${dst:h}
	ln -s $src $dst && echo "linked $dst"
done

missing=(${(f)"$(pacman -T ${=$(<$DOTFILES/packages.txt)})"})
if (( $#missing )); then
	echo "\nMissing packages — install them, then re-run this script:"
	echo "  sudo pacman -S --needed $missing\n"
fi

# Login screen: greetd runs a bare Hyprland that runs regreet. greetd reads
# /etc/greetd as root, so these are copied (not linked), with @USER@/@HOME@ filled in.
for f in config.toml hyprland-config regreet.toml; do
	sed -e "s|@USER@|$USER|g" -e "s|@HOME@|$HOME|g" $DOTFILES/greetd/$f |
		sudo install -Dm644 /dev/stdin /etc/greetd/$f
done
dm=$(readlink /etc/systemd/system/display-manager.service)
if [[ -n $dm && ${dm:t} != greetd.service ]]; then
	echo "\n${dm:t} is the display manager — switch with:"
	echo "  sudo systemctl disable ${dm:t} && sudo systemctl enable greetd\n"
else
	sudo systemctl enable greetd
fi

# Session services, started with graphical-session.target under uwsm
systemctl --user enable $DOTFILES/systemd/swayosd.service
systemctl --user enable hypridle hyprpaper waybar hyprpolkitagent cliphist gcr-ssh-agent.socket

# Dark theme (persisted by dconf)
gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"   # GTK3
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark" # GTK4

# .zshrc expects oh-my-zsh (it installs its own plugins on first start)
[[ -d ~/.oh-my-zsh ]] || git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
fi
