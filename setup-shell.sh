#!/bin/bash
# Script      : setup-shell.sh
# Description : Setup the shell using the files in the myshell/ directory
# Author      : Le_SaRo
# Date        : 2024.01.22, V1.0
# Date        : 2024.06.14, V1.1, Renaming

USHDIR="$HOME""/myshell"
CONFDIR="$HOME""/.config"

function ask() {
	read -rp "$1? (Y/n): " response
	[ -z "$response" ] || [ "$response" = "y" ]
}

# Install zshrc
if ask "Copy .zshrc"; then
	ln -s $(realpath "$MYSHDIR"/shell/zshrc) "$HOME"/.zshrc
	if ask "Enable colored man pages"; then
		git clone https://github.com/ael-code/zsh-colored-man-pages.git "$HOME"/.zsh/plugins/zsh-colores-man-pages
	fi

	if ask "Config shell .env"; then
		# zsh plugins
		read -rp "zsh plugins path: " response
		echo "USH_DIR_ZSH_PLUGINS=""$response" >>"$USHDIR"/shell/.env-shell
		# python venv path
		read -rp "Python venv path: " response
		echo "USH_DIR_DATA=""$response" >>"$USHDIR"/shell/.env-shell
		# data drive
		read -rp "Data drive path: " response
		echo "USH_DIR_DATA=""$response" >>"$USHDIR"/shell/.env-shell
		# developement
		read -rp "Developement path: " response
		echo "USH_DIR_DEV=""$response" >>"$USHDIR"/shell/.env-shell
		# notetaker
		read -rp "Notetaker path: " response
		echo "USH_DIR_NOTETAKER=""$response" >>"$USHDIR"/shell/.env-shell
	fi
fi

# Alacritty config
if ask "Install alcritty config"; then
	mkdir -p "$CONFDIR""/alacritty/themes"
	ln -s "$(realpath "$USHDIR"/terminal/alacritty.toml)" "$CONFDIR"/alacritty/alacritty.toml
	wget -O "$CONFDIR"/alacritty/themes/"theme.toml" https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes/campbell.toml
fi

# tmux config
if ask "Install tmux config"; then
	ln -s "$(realpath "$USHDIR"/tmux/tmux.conf)" "$HOME"/.tmux.conf

	git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm
	ln -sn "$(realpath "$USHDIR"/tmux/powerline/config.sh)" "$CONFDIR"/tmux-powerline/

	if ask "Config tmux .env"; then
		# Weather cordinates
		read -rp "Location latitude" response
		echo "USH_TPL_W_LAT=""$response" >>"$USHDIR""/tmux/.env-tmux"
		read -rp "Location longitude" response
		echo "USH_TPL_W_LON=""$response" >>"$USHDIR""/tmux/.env-tmux"
	fi
fi

# Neovim config
if ask "Install neovim config"; then
	git clone https://github.com/LeSaRo/saro.nvim "$CONFDIR"/nvim
fi
