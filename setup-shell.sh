#!/bin/bash
# Script      : setup-shell.sh
# Description : Setup the shell using the files in the ushell/ directory
# Author      : Le_SaRo
# Date        : 2024.01.22, V1.0

USHDIR="$HOME""/ushell"
CONFDIR="$HOME""/.config"

function ask() {
	read -rp "$1? (Y/n): " response
	[ -z "$response" ] || [ "$response" = "y" ]
}

# Install zshrc
if ask "Copy .zshrc"; then
	ln -s $(realpath "$USHDIR"/shell/zshrc) "$HOME"/.zshrc
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
	mkdir -p "$CONFDIR"/tmux-powerline/themes
	mkdir -p "$CONFDIR"/tmux-powerline/segments
	ln -s "$(realpath "$USHDIR"/tmux/powerline/config.sh)" "$CONFDIR"/tmux-powerline/config.sh
	ln -s "$(realpath "$USHDIR"/tmux/powerline/theme.sh)" "$CONFDIR"/tmux-powerline/themes/user.sh
	ln -s "$(realpath "$USHDIR"/tmux/powerline/segments/modes.sh)" "$CONFDIR"/tmux-powerline/segments/modes.sh
	ln -s "$(realpath "$USHDIR"/tmux/powerline/segments/text.sh)" "$CONFDIR"/tmux-powerline/segments/text.sh

	if ask "Config tmux .env"; then
		# Alt colors
		c_base="$(tput setaf 21)█$(tput setaf 27)█$(tput setaf 33)█"
		c_alt="$(tput setaf 81)██$(tput setaf 218)██"
		c_white="$(tput setaf 7)"
		read -rp "Use alt colors (0=${c_base} 1={$c_alt}${c_white}" response
		echo "USH_TPL_TH_ALT=""$response" >>"$USHDIR""/tmux/.env-tmux"

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
