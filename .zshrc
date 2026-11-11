# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="" # prompt comes from starship
export KEEP_ZSHRC=yes
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

COMPLETION_WAITING_DOTS="true"
ZLE_REMOVE_SUFFIX_CHARS=""
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE

plugins=(
	archlinux
	bazel
	bgnotify
	direnv
	docker
	docker-compose
	fzf
	gcloud
	gh
	git
	golang
	gpg-agent
	kubectl
	npm
	pip
	python
	rust
	sudo
	tmux
	uv
	volta
	vscode
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
)

if [[ ! -d "$ZSH/custom/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-autosuggestions
fi

if [[ ! -d "$ZSH/custom/plugins/zsh-completions" ]]; then
      git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-completions
fi

if [[ ! -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting
fi


# User configuration

export LANG=en_US.UTF-8
# Don't set TERM here: the terminal sets it, and tmux sets its own inside panes.

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export EDITOR='nvim'

export GOPATH="$HOME/projects/go"
export GOBIN="$GOPATH/bin"

source "$HOME/.cargo/env"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$GOBIN:$PATH"

export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


source $ZSH/oh-my-zsh.sh

alias watch='watch '
alias sudo='sudo '
alias n="nvim"
alias gg="gitui"
alias ls='eza'
alias l='eza -l --all --group-directories-first --git'
alias ll='eza -l --all --all --group-directories-first --git'
alias lt='eza -T --git-ignore --level=2 --group-directories-first'
alias llt='eza -lT --git-ignore --level=2 --group-directories-first'
alias lT='eza -T --git-ignore --level=4 --group-directories-first'

eval "$(starship init zsh)"

# Machine-local settings, not tracked in the dotfiles repo
[[ -f "$HOME/.extra.zsh" ]] && source "$HOME/.extra.zsh"
