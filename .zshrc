# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
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
	bgnotify
	brew
	celery
	docker
	docker-compose
	fzf
	gcloud
	gh
	git
	golang
	gpg-agent
	kubectl
	minikube
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
# Track last sourced .extra.zshrc to avoid duplicate sourcing
_last_sourced_extra=""

function source_extra_zshrc_if_exists() {
  local extra_rc="$PWD/.extra.zsh"
  if [[ -f "$extra_rc" && "$extra_rc" != "$_last_sourced_extra" ]]; then
    source "$extra_rc"
    _last_sourced_extra="$extra_rc"
  fi
}

# Hook: when changing directories
function chpwd() {
  source_extra_zshrc_if_exists
}

FPATH="/home/linuxbrew/.linuxbrew/share/zsh/site-functions:${FPATH}"

export LANG=en_US.UTF-8
export TERM=tmux-256color

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export EDITOR='nvim'

export GOPATH="$HOME/projects/go"
export GOBIN="$GOPATH/bin"

export ANDROID_HOME="$HOME/Android/Sdk"

export PATH="$PATH:$GOBIN:$HOME/.docker/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"

export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


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

# Also run it once when the shell starts
source_extra_zshrc_if_exists
