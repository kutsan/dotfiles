typeset -g -a TRANSMISSION_DAEMON_FLAGS=(
	--download-dir $HOME/Downloads
	--watch-dir $HOME/Downloads
)

typeset -g -a TRANSMISSION_REMOTE_FLAGS=(
	--trash-torrent
)

# Set options as string and remove temporary arrays.
export TRANSMISSION_DAEMON_OPTIONS="$TRANSMISSION_DAEMON_FLAGS[@]" && unset TRANSMISSION_DAEMON_FLAGS
export TRANSMISSION_REMOTE_OPTIONS="$TRANSMISSION_REMOTE_FLAGS[@]" && unset TRANSMISSION_REMOTE_FLAGS
