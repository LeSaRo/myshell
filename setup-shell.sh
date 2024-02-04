#!/bin/bash
# Script      : setup-shell.sh
# Description : Setup the shell using the files in the ushell/ directory
# Author      : Le_SaRo
# Date        : 2024.01.22, V1.0

USHDIR="$HOME""/ushell"
CONFDIR="$HOME""/.config"

function ask() {
	read -rp "$1? (Y/n): " RESPONSE
	[ -z "$RESPONSE" ] || [ "$RESPONSE" = "y" ]
}

# Install zshrc
if ask "Copy .zshrc"; then
	ln -s $(realpath "$USHDIR"/shell/zshrc) "$HOME"/.zshrc
	if ask "Enable colored man pages"; then
		git clone https://github.com/ael-code/zsh-colored-man-pages.git "$HOME"/.zsh/plugins/zsh-colores-man-pages
	fi

	if ask "Config shell .env"; then
		# data drive
		read -rp "data drive path" RESPONSE
		echo "USH_DIR_DATA=""$RESPONSE" >>"$USHDIR"/shell/.env-shell
		# developement
		read -rp "developement path" RESPONSE
		echo "USH_DIR_DEV=""$RESPONSE" >>"$USHDIR"/shell/.env-shell
		# notetaker
		read -rp "notetaker path" RESPONSE
		echo "USH_DIR_NOTETAKER=""$RESPONSE" >>"$USHDIR"/shell/.env-shell
	fi
fi

# Alacritty config
if ask "Install alcritty config"; then
	mkdir -p "$CONFDIR""/alacritty/themes"
	ln -s "$(realpath "$USHDIR"/alacritty/alacritty.toml)" "$CONFDIR"/alacritty/alacritty.toml
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
		C_BASE="$(tput setaf 21)█$(tput setaf 27)█$(tput setaf 33)█"
		C_ALT="$(tput setaf 81)██$(tput setaf 218)██"
		C_WHITE="$(tput setaf 7)"
		read -rp "Use alt colors (0=${C_BASE} 1={$C_ALT}$(tput setaf 7))" RESPONSE
		echo "USH_TPL_TH_ALT=""$RESPONSE" >>"$USHDIR""/tmux/.env"

		# Weather cordinates
		read -rp "Location latitude" RESPONSE
		echo "USH_TPL_W_LAT=""$RESPONSE" >>"$USHDIR""/tmux/.env"
		read -rp "Location longitude" RESPONSE
		echo "USH_TPL_W_LON=""$RESPONSE" >>"$USHDIR""/tmux/.env"
	fi
fi

# Neovim config
if ask "Install neovim config"; then
	git clone https://github.com/LeSaRo/saro.nvim "$CONFDIR"/nvim
fi
