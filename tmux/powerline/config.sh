# Default configuration file for tmux-powerline.
# Modeline {
#	 vi: foldmarker={,} foldmethod=marker foldlevel=0 tabstop=4 filetype=sh
# }

# General {
	# Show which segment fails and its exit code.
	export TMUX_POWERLINE_DEBUG_MODE_ENABLED="false"
	# Use patched font symbols.
	export TMUX_POWERLINE_PATCHED_FONT_IN_USE="true"

	# The theme to use.
	export TMUX_POWERLINE_THEME="user"
	# Overlay directory to look for themes. There you can put your own themes outside the repo. Fallback will still be the "themes" directory in the repo.
	export TMUX_POWERLINE_DIR_USER_THEMES="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/themes"
	# Overlay directory to look for segments. There you can put your own segments outside the repo. Fallback will still be the "segments" directory in the repo.
	export TMUX_POWERLINE_DIR_USER_SEGMENTS="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/segments"

	# The initial visibility of the status bar. Can be {"on, off"}.
	export TMUX_POWERLINE_STATUS_VISIBILITY="on"
	# The status bar refresh interval in seconds.
	# Note that events that force-refresh the status bar (such as window renaming) will ignore this.
	export TMUX_POWERLINE_STATUS_INTERVAL="1"
	# The location of the window list. Can be {"absolute-centre, centre, left, right"}.
	# Note that "absolute-centre" is only supported on `tmux -V` >= 3.2.
	export TMUX_POWERLINE_STATUS_JUSTIFICATION="centre"

	# The maximum length of the left status bar.
	export TMUX_POWERLINE_STATUS_LEFT_LENGTH="60"
	# The maximum length of the right status bar.
	export TMUX_POWERLINE_STATUS_RIGHT_LENGTH="90"

	# Uncomment these if you want to enable tmux bindings for muting (hiding) one of the status bars.
	# E.g. this example binding would mute the left status bar when pressing <prefix> followed by Ctrl-[
	#export TMUX_POWERLINE_MUTE_LEFT_KEYBINDING="C-["
	#export TMUX_POWERLINE_MUTE_RIGHT_KEYBINDING="C-]"
# }

# date.sh {
	# date(1) format for the date. If you don't, for some reason, like ISO 8601 format you might want to have "%D" or "%m/%d/%Y".
	export TMUX_POWERLINE_SEG_DATE_FORMAT="%F"
# }

# hostname.sh {
	# Use short or long format for the hostname. Can be {"short, long"}.
	export TMUX_POWERLINE_SEG_HOSTNAME_FORMAT="short"
# }

# pwd.sh {
	# Maximum length of output.
	export TMUX_POWERLINE_SEG_PWD_MAX_LEN="20"
# }

# time.sh {
	# date(1) format for the time. Americans might want to have "%I:%M %p".
	export TMUX_POWERLINE_SEG_TIME_FORMAT="%H:%M"
	# Change this to display a different timezone than the system default.
	# Use TZ Identifier like "America/Los_Angeles"
	export TMUX_POWERLINE_SEG_TIME_TZ=""
# }

# tmux_session_info.sh {
	# Session info format to feed into the command: tmux display-message -p
	# For example, if FORMAT is '[ #S ]', the command is: tmux display-message -p '[ #S ]'
	export TMUX_POWERLINE_SEG_TMUX_SESSION_INFO_FORMAT="#S:#I.#P"
# }

# weather.sh {
	# The data provider to use. Currently only "yahoo" is supported.
	export TMUX_POWERLINE_SEG_WEATHER_DATA_PROVIDER="yrno"
	# What unit to use. Can be any of {c,f,k}.
	export TMUX_POWERLINE_SEG_WEATHER_UNIT="c"
	# How often to update the weather in seconds.
	export TMUX_POWERLINE_SEG_WEATHER_UPDATE_PERIOD="600"
	# Name of GNU grep binary if in PATH, or path to it.
	export TMUX_POWERLINE_SEG_WEATHER_GREP="grep"
	# Location of the JSON parser, jq
	export TMUX_POWERLINE_SEG_WEATHER_JSON="jq"
	# Your location
	# Latitude and Longtitude for use with yr.no
    TMUX_POWERLINE_SEG_WEATHER_LAT="42"
    TMUX_POWERLINE_SEG_WEATHER_LON="6"
# }

# modes.sh {
# Prefix pressed text
export TMUX_POWERLINE_MODES_PREFIX_TEXT="P"
# Insert mode text
export TMUX_POWERLINE_MODES_INSERT_TEXT="I"
# Copy mode text
export TMUX_POWERLINE_MODES_COPY_TEXT="C"
# Normal mode text
export TMUX_POWERLINE_MODES_NORMAL_TEXT="N"
# Separator text
export TMUX_POWERLINE_MODES_SEPARATOR_TEXT="|"

# Prefix pressed color
export TMUX_POWERLINE_MODES_PREFIX_COLOR="colour9"
# Insert mode color
export TMUX_POWERLINE_MODES_NORMAL_COLOR="colour255"
# Copy mode color
export TMUX_POWERLINE_MODES_COPY_COLOR="colour22"
# Background color
export TMUX_POWERLINE_MODES_BG_COLOR="colour27"
# }
