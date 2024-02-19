# Print some text

TMUX_POWERLINE_SEG_TEXT_DEFAULT="tmux"

generate_segmentrc() {
	read -d '' rccontents <<EORC
# Text to show
export TMUX_POWERLINE_SEG_TEXT="${TMUX_POWERLINE_SEG_TEXT_DEFAULT}"
EORC
	echo "$rccontents"
}

__process_settings() {
	if [ -z "$TMUX_POWERLINE_SEG_TEXT" ]; then
		export TMUX_POWERLINE_SEG_TEXT="${TMUX_POWERLINE_SEG_TEXT_DEFAULT}"
	fi
}

run_segment() {
	__process_settings
	echo "$TMUX_POWERLINE_SEG_TEXT"
	return 0
}
