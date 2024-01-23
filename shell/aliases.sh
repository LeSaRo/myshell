#!/bin/sh

# Overrides
alias ls="lsd --color=auto --group-dirs=first"
alias toilet="toilet -d /usr/share/figlet/fonts"

#Terminal
alias p="sudo pacman"
alias sp="pacman -Ss"
alias c="clear"
alias m="man"
alias mkd="mkdir -v"
alias hist="history"
alias la="ls -a"
alias ll="ls -lh"
alias lla="ll -a"
alias lt="ls --tree"
alias lta="lt -a"
alias cdda="cd /media/data"
alias cdde="cd /media/data/developement"
alias cdnt="cd /media/data/textes/notetaker"
alias zshrl="source $HOME/.zshrc"

#Config
alias ush="v $HOME/ushell"
alias ushac="v $HOME/ushell/alacritty/"
alias ushal="v $HOME/ushell/shell/aliases.sh"
alias ushlzv="v $HOME/ushell/lzvim-core.lua"
alias ushtmux="v $HOME/ushell/tmux/"
alias ushssh="v $HOME/ushell/shell/ssh-aliases.sh"

#Developement
alias v="nvim"
alias sv="sudo nvim"
alias ged="gedit"
## Git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gpl="git pull"
alias gps="git push"
## MkDocs
alias mkds="mkdocs serve"
alias mkdb="MKD_PDF_EXPORT=1 mkdocs build"

#Internet
alias yt="yt-dlp -f best -ciw -o \"%(title)s.%(ext)s\" -v" #DL YT vid as MP4
alias yta="yt-dlp --add-metadata -xic --audio-format mp3"  #DL YT vid audio as MP3

# Games
alias thprac-16="WINEPREFIX=/media/data/SteamLibrary/steamapps/compatdata/745880/pfx/ $HOME/.local/share/Steam/compatibilitytools.d/GE-Proton8-23/files/bin/wine /media/data/Jeux/Touhou/thprac/thprac.v2.2.1.4.exe"

#Silly
alias TheSenseOfLife="help 42"
alias hack="cmatrix"
