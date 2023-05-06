# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export KEEP_ZSHRC=yes
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

COMPLETION_WAITING_DOTS="true"
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE

plugins=(
	bgnotify
	brew
	celery
	docker
	docker-compose
	fd
	fzf
	gh
	git
	golang
	gpg-agent
	kubectl
	minikube
	npm
	nvm
	pip
	pipenv
	pyenv
	python
	ripgrep
	rust
	sudo
	tmux
	vscode
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
)

if [[ $(uname) == "Darwin" ]]; then
	plugins+=(macos)
else
	plugins+=(archlinux)
fi

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

FPATH="/home/linuxbrew/.linuxbrew/share/zsh/site-functions:${FPATH}"

export LANG=en_US.UTF-8

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export EDITOR='nvim'

export GOPATH="$HOME/Projects/Go"
export GOBIN="$GOPATH/bin"

export ANDROID_HOME="$HOME/Android/Sdk"

export PATH="$PATH:$GOBIN:$HOME/.docker/bin"
export PATH="$PATH:$HOME/.cargo/bin"

export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

zstyle ':omz:plugins:nvm' lazy true

source $ZSH/oh-my-zsh.sh

alias n="nvim"
alias gg="gitui"
alias ls='exa'
alias l='exa -l --all --group-directories-first --git'
alias ll='exa -l --all --all --group-directories-first --git'
alias lt='exa -T --git-ignore --level=2 --group-directories-first'
alias llt='exa -lT --git-ignore --level=2 --group-directories-first'
alias lT='exa -T --git-ignore --level=4 --group-directories-first'

eval "$(starship init zsh)"
