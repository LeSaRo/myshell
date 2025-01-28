#!/bin/bash
# Script      : setup-shell.sh
# Description : Setup the shell using the files in the myshell/ directory
# Author      : Le_SaRo
# Date        : 2024.01.22, V1.0
# Date        : 2024.06.14, V1.1, Renaming

MYSHDIR="$HOME""/myshell"
CONFDIR="$HOME""/.config"

function ask() {
	read -rp "$1? (Y/n): " response
	[ -z "$response" ] || [ "$response" = "y" ]
}

# Install zshrc
if ask "Copy .zshrc"; then
	ln -s $(realpath "$MYSHDIR"/shell/zshrc) "$HOME"/.zshrc
	ln -s $(realpath "$MYSHDIR"/shell/zprofile) "$HOME"/.zprofile
	if ask "Enable colored man pages"; then
		git clone https://github.com/ael-code/zsh-colored-man-pages.git "$HOME"/.zsh/plugins/zsh-colores-man-pages
	fi

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
		read -rp "Voile path: " response
		echo "MYSH_DIR_VOILE=""$response" >>"$MYSHDIR"/shell/.env-shell
	fi
fi

# Alacritty config
if ask "Install alcritty config"; then
	mkdir -p "$CONFDIR""/alacritty/themes"
	ln -s "$(realpath "$MYSHDIR"/terminal/alacritty.toml)" "$CONFDIR"/alacritty/alacritty.toml
	wget -O "$CONFDIR"/alacritty/themes/"theme.toml" https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes/campbell.toml
fi

# tmux config
if ask "Install tmux config"; then
	ln -s "$(realpath "$MYSHDIR"/tmux/tmux.conf)" "$HOME"/.tmux.conf

	git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm
	ln -sfn "$(realpath "$MYSHDIR"/tmux/powerline/)" "$CONFDIR"/tmux-powerline/
fi

# Neovim config
if ask "Install neovim config"; then
	git clone https://github.com/LeSaRo/saro.nvim "$CONFDIR"/nvim
fi
