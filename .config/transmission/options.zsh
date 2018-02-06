typeset -a TRANSMISSION_FLAGS=(
	--download-dir $HOME/Downloads
	--watch-dir $HOME/Downloads
)

# Set options as string and remove temporary array.
export TRANSMISSION_OPTIONS="$TRANSMISSION_FLAGS[@]" && unset TRANSMISSION_FLAGS
