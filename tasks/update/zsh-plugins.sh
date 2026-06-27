#!/usr/bin/env bash

set -euo pipefail

find_plugin_files() {
	local plugins_dir=$1

	find "$plugins_dir" \
		-maxdepth 1 \
		-name '*.zsh' \
		-type f \
		-print0 |
		sort -z
}

get_plugin_name() {
	local file=$1
	local base="${file##*/}"
	printf '%s' "${base%.*}"
}

get_plugin_repo() {
	local file=$1
	grep -m1 $'^\tfor ' "$file" | awk '{print $2}' || true
}

is_github_release() {
	local file=$1
	grep -q 'from"github-rel"' "$file"
}

fetch_release_revision() {
	local repo=$1

	curl --silent "https://api.github.com/repos/$repo/releases/latest" |
		grep -o '"tag_name": *"[^"]*"' |
		cut -d'"' -f4
}

fetch_commit_revision() {
	local repo=$1

	git ls-remote "https://github.com/$repo" HEAD | awk '{print $1}'
}

process_plugin() {
	local plugin=$1
	local name repo fetcher revision

	name=$(get_plugin_name "$plugin")
	repo=$(get_plugin_repo "$plugin")
	[[ -z $repo ]] && return 0

	if is_github_release "$plugin"; then
		fetcher='fetch_release_revision'
	else
		fetcher='fetch_commit_revision'
	fi

	revision=$("$fetcher" "$repo")
	printf '  %s -> %s\n' "$name" "$revision" >&2

	printf '%s,%s\n' "$name" "$revision"
}

generate_lockfile() {
	local plugins_dir=$1

	printf '%s\n' 'name,revision'

	while IFS= read -r -d '' plugin; do
		process_plugin "$plugin"
	done < <(find_plugin_files "$plugins_dir")
}

main() {
	local tmpfile=$1
	local plugins_dir="$MISE_PROJECT_ROOT/home/dot_config/exact_zsh/exact_plugins"
	local lockfile="$MISE_PROJECT_ROOT/home/dot_config/exact_zsh/plugins-lock.csv"

	generate_lockfile "$plugins_dir" >"$tmpfile"

	mv -- "$tmpfile" "$lockfile"
}

tmpfile=$(mktemp)
trap 'rm -f -- "$tmpfile"' EXIT INT TERM
main "$tmpfile"
