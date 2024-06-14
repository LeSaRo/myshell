#!/bin/sh

# Overrides
alias ls="lsd --color=auto --group-dirs=first"
alias toilet="toilet -d /usr/share/figlet/fonts"

# cd
alias ...="../.."
alias ....="../../.."

# Terminal
alias p="sudo pacman"
alias sp="pacman -Ss"
alias c="clear"
alias m="man"
alias mkd="mkdir -v"
alias hist="history"
alias zshrl="source $HOME/.zshrc"
alias pern="perl-rename"
## ls
alias la="ls -a"
alias ll="ls -lh"
alias lla="ll -a"
alias lt="ls --tree"
alias lta="lt -a"
## Directories
alias cdda="cd ""$MYSH_DIR_DATA"
alias cdde="cd ""$MYSH_DIR_DEV"
alias cdnt="cd ""$MYSH_DIR_NOTETAKER"
alias notetaker="v $MYSH_DIR_NOTETAKER"
alias normalise-names="perl-rename -v \"y/A-Z/a-z/; y/ ,/-/; s/[~#()\!\&_]/-/g; s/-{2,}/-/g; s/'//g\" *"
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

# Games
alias thprac-16="WINEPREFIX=/media/data/SteamLibrary/steamapps/compatdata/745880/pfx/ $HOME/.local/share/Steam/compatibilitytools.d/GE-Proton8-23/files/bin/wine /media/data/Jeux/Touhou/thprac/thprac.v2.2.1.4.exe"

# Silly
alias TheSenseOfLife="help 42"
alias hack="cmatrix"
