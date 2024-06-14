#!/bin/bash
# Script      : setup-shell.sh
# Description : Setup the shell using the files in the myshell/ directory
# Author      : Le_SaRo
# Date        : 2024.01.22, V1.0
# Date        : 2024.06.14, V1.1, Renaming

MYSHELLDIR="$HOME""/myshell"
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
		echo "MYSH_DIR_ZSH_PLUGINS=""$response" >>"$MYSHELLDIR"/shell/.env-shell
		# python venv path
		read -rp "Python venv path: " response
		echo "MYSH_DIR_DATA=""$response" >>"$MYSHELLDIR"/shell/.env-shell
		# data drive
		read -rp "Data drive path: " response
		echo "MYSH_DIR_DATA=""$response" >>"$MYSHELLDIR"/shell/.env-shell
		# developement
		read -rp "Developement path: " response
		echo "MYSH_DIR_DEV=""$response" >>"$MYSHELLDIR"/shell/.env-shell
		# notetaker
		read -rp "Notetaker path: " response
		echo "MYSH_DIR_NOTETAKER=""$response" >>"$MYSHELLDIR"/shell/.env-shell
	fi
fi

# Alacritty config
if ask "Install alcritty config"; then
	mkdir -p "$CONFDIR""/alacritty/themes"
	ln -s "$(realpath "$MYSHELLDIR"/terminal/alacritty.toml)" "$CONFDIR"/alacritty/alacritty.toml
	wget -O "$CONFDIR"/alacritty/themes/"theme.toml" https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes/campbell.toml
fi

# tmux config
if ask "Install tmux config"; then
	ln -s "$(realpath "$MYSHELLDIR"/tmux/tmux.conf)" "$HOME"/.tmux.conf

	git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm
	ln -sn "$(realpath "$MYSHELLDIR"/tmux/powerline/config.sh)" "$CONFDIR"/tmux-powerline/

	if ask "Config tmux .env"; then
		# Weather cordinates
		read -rp "Location latitude" response
		echo "MYSH_TPL_W_LAT=""$response" >>"$MYSHELLDIR""/tmux/.env-tmux"
		read -rp "Location longitude" response
		echo "MYSH_TPL_W_LON=""$response" >>"$MYSHELLDIR""/tmux/.env-tmux"
	fi
fi

# Neovim config
if ask "Install neovim config"; then
	git clone https://github.com/LeSaRo/saro.nvim "$CONFDIR"/nvim
fi
