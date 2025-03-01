export TERM="xterm-256color"
export BROWSER=/usr/bin/librewolf
export EDITOR='nvim'
export MANPAGER='nvim +Man!'

# Path to your oh-my-zsh installation.
ZSH=~/.oh-my-zsh

# theme
ZSH_THEME="cloud"

# Which plugins would you like to load?
plugins=(
    git                     # shows stuff related to github
    github
    vi-mode                 # somewhat useful
    dirhistory              # press alt + <- or -> to navigate cd stack 
    colored-man-pages
    archlinux
    # tmux
)

# ###Plugin configs### #
#
# vi mode
# 1. disable the cursor style cuz the beam cursor is ugly
ZVM_CURSOR_STYLE_ENABLED=false

export LS_COLORS='di=1;35:ln=1;36:so=1;33:pi=40;33:ex=1;32:bd=40;33;01:cd=40;33;01:su=1;31:sg=1;31:tw=1;34:ow=1;34:'

# aliases
alias updatezsh='source ~/.zshrc'
alias bk="cd .."

# vim
alias svim="sudo vim "
alias nv="nvim "
alias nvima="nvim -p *"

# juce related things
# generate a ccls file for juce. run in project root
alias cclsjuce="cd /Builds/LinuxMakeFile; bear -- make; cp compile_commands ../.."

alias systemctl="sudo systemctl "
alias mkcd="mkdir $1 && cd $1"                        # make dir and cd to it
alias df="df -h"
alias grepjctl="sudo journalctl | grep $1"
alias pacdate="sudo pacman -Syu "
alias pacremove='sudo pacman -R '
alias pacstall="sudo pacman -Sy "
alias quickclone='git clone https://www.github.com/$1' # quickclone "username/repo"
alias projucer='Projucer'
alias cs='mcs -out:$1.exe $1;mono $1.exe'
alias cl="clear"
alias claer="clear"
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias hibernate="sudo systemctl hibernate"

junoclone() {
  local token="<tokenhere>"
  local user="$1"
  local repo="$2"
  
  if [[ -z $user || -z $repo ]]; then
    echo "Usage: junoclone <user> <repo>"
    return 1
  fi
  
  git clone "https://${token}@github.com/${user}/${repo}.git"
}


ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# have to manually set these cuz oh my zsh is weird
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $ZSH/oh-my-zsh.sh

# ls colors

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

