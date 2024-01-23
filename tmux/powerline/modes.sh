# Indicator of pressing TMUX prefix, copy and insert modes.
# More compact version of mode_indicator

prefix_pressed_text="P"
insert_mode_text="I"
copy_mode_text="C"
normal_mode_text="N"
separator="|"

prefix_mode_fg="colour9"
normal_mode_fg="colour255"
copy_mode_fg="colour22"
bg="colour21"

run_segment() {
	prefix_indicator="#[bg=${bg}]#{?client_prefix,#[fg=${prefix_mode_fg}]${prefix_pressed_text},#[fg=${normal_mode_fg}]${normal_mode_text}}"
	normal_or_copy_indicator="#[bg=${bg}]#{?pane_in_mode,#[fg=${copy_mode_fg}]${copy_mode_text},#[fg=${normal_mode_fg}]${insert_mode_text}}"
	echo $prefix_indicator"#[fg=${normal_mode_fg}]${separator}"$normal_or_copy_indicator
	return 0
}
