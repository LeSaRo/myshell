#!/bin/sh

# Overrides
alias ls="lsd --color=auto --group-dirs=first"
#alias toilet="toilet -d /usr/share/figlet/fonts"
alias ip="ip --color=auto"

# cd
alias ...="../.."
alias ....="../../.."

# Terminal
alias p="sudo pacman"
alias sp="pacman -Ss"
alias c="clear"
alias m="man"
alias mkd="mkdir -pv"
alias copy="cp -rv"
alias hist="history"
alias zshrl="source $HOME/.zshrc"
alias pern="perl-rename -v"
alias pernt="pern -n"
alias weather="curl fr.wttr.in/Genève\?qf"
alias bm="bashmount"
alias curlclip="curl -O \$(xclip -o); ls"
## ls
alias la="ls -a"
alias ll="ls -lh"
alias lla="ll -a"
alias l1="ls -1"
alias l1a="l1 -a"
alias lt="ls --tree"
alias lta="lt -a"
## Directories
alias cdda="cd ""$MYSH_DIR_DATA"
alias cdmt="cd /run/media/$(whoami)"
alias cdde="cd ""$MYSH_DIR_DEV"
alias cdgr="cd ""$MYSH_DIR_GRIMOIRE"
alias grimoire="v $MYSH_DIR_GRIMOIRE/docs"
# Make names lowercase, remove special characters, remove groups of ".-" or "-.", compress groups of "-"
alias normalise-names="perl-rename -v \"y/A-Z/a-z/; y/ ,/-/; s/[~#()\!\&_]/-/g; s/\.-/-/; s/-\./\./; s/'//g; s/-{2,}/-/g\" *"
alias dusthis="dust -d=1"
## Config
alias mysh="v ""$HOME""/myshell"
alias myshal="v ""$HOME""/myshell/alacritty/"
alias myshnv="v ""$HOME""/myshell/nvim/"
alias myshsh="v ""$HOME""/myshell/shell/"
alias myshtmux="v ""$HOME""/myshell/tmux/"
alias nvimconf="v ""$HOME""/.config/nvim/"

# Developement
alias v="nvim"
alias sv="sudo nvim"
alias ged="gedit"
alias venv="source ""$MYSH_DIR_VENV""/bin/activate"
## Git
alias g="git"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gpl="git pull"
alias gps="git push"
## MkDocs
alias mkds="mkdocs serve"
alias mkdb="MKD_PDF_EXPORT=1 mkdocs build"

# Internet
alias yt="yt-dlp -f best -ciw -o \"%(title)s.%(ext)s\" -v" #DL YT vid as MP4
alias yta="yt-dlp --add-metadata -xic --audio-format mp3"  #DL YT vid audio as MP3

# Silly
alias TheSenseOfLife="help 42"
alias hack="cmatrix"
