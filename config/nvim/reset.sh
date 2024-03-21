#!/bin/sh

NVIM_CACHE="$HOME"/.cache/nvim
NVIM_SHARE="$HOME"/.local/share/nvim
NVIM_STATE="$HOME"/.local/state/nvim

printf "WARNING: This script will remove these directories:\n"
printf "%s\n%s\n%s\n\n" "$NVIM_CACHE" "$NVIM_SHARE" "$NVIM_STATE"
printf "Proceed? (y/N): "
read -r ans

case "$ans" in
	[yY])
		printf "Answered yes. Removing directories...\n"
		rm -rf "$NVIM_CACHE" "$NVIM_SHARE" "$NVIM_STATE"
		printf "SUCCESS: Directories removed.\n"
		exit 0
		;;
	[nN])
		printf "Answered no. Script has been stopped.\n"
		exit 1
		;;
	*)
		printf "Invalid answer. Script has been stopped.\n"
		exit 1
		;;
esac
