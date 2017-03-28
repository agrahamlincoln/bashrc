#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/crazy_prompt.sh

# Local, unversioned init.
if [ -f $DIR/init-local.sh ]
then
  source $DIR/init-local.sh
fi

# Aliases.
alias ..="cd .."
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias brc="vim ~/src/bashrc/init.sh"
alias brcl="vim ~/src/bashrc/init-local.sh"
alias src="source ~/.bashrc"
# Git.
alias gca="git commit -a"
alias gb="git branch"
alias gd="git diff"
alias gdc="git diff --cached"
alias gch="git checkout"
alias gpom="git pull origin master"
alias gp="git pull"
alias gs="git status"
alias gbddd="git branch --merged | grep -v '\*' | grep -v '^  master$' | xargs -n 1 git branch -d"

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history

# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
shopt -s histappend
stophistory () {
  PROMPT_COMMAND="bash_prompt_command"
  echo 'History recording stopped. Make sure to `kill -9 $$` at the end of the session.'
}

# Go path.
export GOPATH=$HOME/src/go/
export PATH=$PATH:$GOPATH/bin

# Setup ssh-agent.
if [[ $OSTYPE == 'linux-gnu' ]]; then
  pgrep -f ssh-agent > /dev/null || ssh-agent > ~/.ssh/agent_config.sh
  eval `cat ~/.ssh/agent_config.sh`
fi

