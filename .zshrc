# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export KEEP_ZSHRC=yes

if [[ ! -d "${ZSH_CUSTOM:-$ZSH/custom}/themes/powerlevel10k" ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$ZSH/custom}/themes/powerlevel10k
fi

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

alias fd=fdfind

export LANG=en_US.UTF-8
export EDITOR='vim'

export GOPATH="$HOME/Projects/Go"
export GOBIN="$GOPATH/bin"

export ANDROID_HOME="$HOME/Android/Sdk"

export PATH="/usr/local/go/bin:/snap/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$GOBIN"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$HOME/.cargo/bin:$PATH"

export FZF_DEFAULT_COMMAND="fdfind --type file --follow --hidden --exclude .git --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"


source $ZSH/oh-my-zsh.sh

[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
