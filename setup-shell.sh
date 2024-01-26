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
	ln -s "$(realpath "$USHDIR"/tmux/powerline/text.sh)" "$CONFDIR"/tmux-powerline/segments/text.sh
	ln -s "$(realpath "$USHDIR"/tmux/powerline/modes.sh)" "$CONFDIR"/tmux-powerline/segments/modes.sh
fi

# Neovim (LazyVim) config
if ask "Install lazyvim w/ config"; then
	git clone https://github.com/LazyVim/starter "$CONFDIR"/nvim
	rm -rf "$CONFDIR"/nvim/.git
	ln -s "$(realpath "$USHDIR"/lzvim-core.lua)" "$CONFDIR"/nvim/lua/plugins/core.lua
fi
