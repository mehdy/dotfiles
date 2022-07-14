# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/mehdy/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

plugins=(
	ansible
	bgnotify
	celery
	docker
	docker-compose
	fzf
	gh
	git
	golang
	kubectl
	minikube
	node
	npm
	nvm
	pip
	pipenv
	pyenv
	python
	rbenv
	rust
	sudo
	systemd
	ubuntu
	vim-interaction
	vscode
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
)

if [[ -r "$HOME/.oh-my-zsh/custom/plugins/zsh-async/async.zsh" ]]; then
    source $HOME/.oh-my-zsh/custom/plugins/zsh-async/async.zsh
    async_init
fi

# User configuration

export LANG=en_US.UTF-8
export EDITOR='vim'

export GOPATH="$HOME/Projects/Go"
export GOBIN="$GOPATH/bin"

export ANDROID_HOME="$HOME/Android/Sdk"

export PATH="/usr/local/go/bin:/snap/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$GOBIN"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$HOME/.cargo/bin:$PATH"

if [[ ! -d "$ZSH" ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
