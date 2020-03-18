# Path to your oh-my-zsh installation.
export ZSH="/home/mehdy/.oh-my-zsh"

ZSH_THEME="spaceship"

COMPLETION_WAITING_DOTS="true"

plugins=(
	ansible
	bgnotify
	cargo
	celery
	django
	docker
	docker-compose
	fzf
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

source $HOME/.oh-my-zsh/custom/plugins/zsh-async/async.zsh
async_init

# User configuration

export LANG=en_US.UTF-8
export EDITOR='vim'

export GOPATH="$HOME/Projects/Go"
export GOBIN="$GOPATH/bin"

export ANDROID_HOME="$HOME/Android/Sdk"

export PATH="/usr/local/go/bin:/snap/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$GOBIN"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$HOME/.cargo/bin:$PATH"

export SPACESHIP_TIME_SHOW=true
export SPACESHIP_HOST_SHOW=always
export SPACESHIP_USER_SHOW=always
export SPACESHIP_BATTERY_SHOW=charged
export SPACESHIP_PROMPT_ORDER=(
  battery       # Battery level and status
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  time          # Time stamps section
  venv          # virtualenv section
  pyenv         # Pyenv section
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

source $ZSH/oh-my-zsh.sh
