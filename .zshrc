# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git git-flow python golang docker adb archlinux django react-native systemd terminator vim-interaction kubectl)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$GOBIN"

export GOPATH="$HOME/Projects/Go"
export GOBIN="$GOPATH/bin"

export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

fpath=(~/.zsh/completion $fpath)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='vim'

RPROMPT='%{%K{black}%F{}%}%{%F{default}%}[%*]%f'

# the fcuk alias :D
alias fuck='echo "OKAAAAAY! OKAAAAY!! I will do it!" && sleep 0.8 && sudo $(fc -ln -1)'
alias axel='axel -n 16 -a'
alias px=proxychains
alias v='vim'


# The saviour command
alias del='mv -t /tmp $@'
# give up the bad habbit
alias rm='echo "you should use del command to remove your files safely. if you really want rm back use /bin/rm"'
