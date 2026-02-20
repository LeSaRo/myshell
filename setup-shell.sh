#!/bin/bash
# Script      : setup-shell.sh
# Description : Setup the shell using the files in the myshell/ directory
# Author      : Le_SaRo
# Date        : 2024.01.22, V1.0
# Date        : 2024.06.14, V1.1, Renaming
# Date        : 2025.09.24, V2.0, Restructuring

MYSHDIR="$HOME""/myshell"
CONFDIR="$HOME""/.config"

function ask() {
	read -n 1 -rp "$1? (Y/n): " response
    echo
	[ -z "$response" ] || [ "$response" = "y" ] || [ "$response" = "Y" ]
}

# Install zshrc
if ask "Copy .zshrc"; then
	ln -s $(realpath "$MYSHDIR"/shell/zshrc) "$HOME"/.zshrc
	ln -s $(realpath "$MYSHDIR"/shell/zprofile) "$HOME"/.zprofile

	#if ask "Enable colored man pages"; then
	#	git clone https://github.com/ael-code/zsh-colored-man-pages.git "$HOME"/.zsh/plugins/zsh-colores-man-pages
	#fi

	if ask "Config shell .env"; then
		# zsh plugins
		read -rp "zsh plugins path: " response
		echo "MYSH_DIR_ZSH_PLUGINS=""$response" >>"$MYSHDIR"/shell/.env-shell
		# python venv path
		read -rp "Python venv path: " response
		echo "MYSH_DIR_VENV=""$response" >>"$MYSHDIR"/shell/.env-shell
		# data drive
		read -rp "Data drive path: " response
		echo "MYSH_DIR_DATA=""$response" >>"$MYSHDIR"/shell/.env-shell
		# developement
		read -rp "Developement path: " response
		echo "MYSH_DIR_DEV=""$response" >>"$MYSHDIR"/shell/.env-shell
		# notetaker
		read -rp "Grimoire path: " response
		echo "MYSH_DIR_GRIMOIRE=""$response" >>"$MYSHDIR"/shell/.env-shell
    else
        echo "Using default values"
        cp "$MYSHDIR"/shell/.env-shell-sample "$MYSHDIR"/shell/.env-shell
	fi
fi

# Local scripts
if ask "Install local programs"; then
    mkdir -pv "$HOME/.local/bin"
    for bin in $(ls "$MYSHDIR"/bin)
    do
        ln -s $(realpath "$MYSHDIR"/bin/"$bin") "$HOME"/.local/bin/
    done
fi

# .config
for conf in $(ls "$MYSHDIR"/config)
do
    if ask "Install $conf config"; then
        ln -s $(realpath "$MYSHDIR"/config/"$conf") "$HOME"/.config/
    fi
done

# tmux config
if ask "Install tmux config"; then
	ln -s "$(realpath "$MYSHDIR"/tmux/tmux.conf)" "$HOME"/.tmux.conf

	git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm
	ln -s "$(realpath "$MYSHDIR"/tmux/powerline/)" "$CONFDIR"/tmux-powerline
fi

# Neovim config
if ask "Install neovim config"; then
	git clone https://github.com/LeSaRo/saro.nvim "$CONFDIR"/nvim
fi
