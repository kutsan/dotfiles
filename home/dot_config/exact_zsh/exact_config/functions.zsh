# `cd` into the last directory upon exit using `yazi`.
y() {
	local temp_file="$(mktemp -t "yazi-cwd.XXXXXX")"

	command yazi "$@" --cwd-file="$temp_file"
	local cwd="$(command cat -- "$temp_file")"

	if [[ -n "$cwd" ]] && [[ "$cwd" != "$PWD" ]]; then
		builtin cd -- "$cwd"
	fi

	command rm -f -- "$temp_file"
}

# Generate authentication keys for SSH.
gen-ssh-keygen-ed25519() {
	ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/keys/$1 -C "$2"
}

# Switch to a branch's worktree, creating one at `../<project>--<branch>` if absent.
gwt() {
	if [[ $# -ne 1 ]]; then
		print -u2 "usage: gwt <branch>"
		return 1
	fi

	local branch=$1

	if ! command git show-ref --verify --quiet refs/heads/$branch; then
		print -u2 "branch '$branch' not found"
		return 1
	fi

	local target_ref=refs/heads/$branch
	local worktree_path= current_path= line

	for line in ${(f)"$(command git worktree list --porcelain)"}; do
		if [[ $line == "worktree "* ]]; then
			current_path=${line#worktree }
		elif [[ $line == "branch $target_ref" ]]; then
			worktree_path=$current_path
			break
		fi
	done

	if [[ -z $worktree_path ]]; then
		local common_dir
		common_dir=$(command git rev-parse --path-format=absolute --git-common-dir) || return

		# In a bare repo, common_dir is the repo (e.g. foo.git).
		# Otherwise it's the `.git` dir inside the main worktree.
		local main_worktree

		if [[ $(command git rev-parse --is-bare-repository) == true ]]; then
			main_worktree=$common_dir
		else
			main_worktree=${common_dir:h}
		fi

		local main_name=${main_worktree:t}
		main_name=${main_name%.git}

		local branch_slug=${branch//\//-}
		local parent=${main_worktree:h}

		worktree_path=$parent/$main_name--$branch_slug

		command git worktree add "$worktree_path" "$branch" || return
	fi

	builtin cd -- "$worktree_path"
}

# Tab-completion for `gwt`: completes local branches sorted by committerdate.
_gwt() {
	local -a branches=(${(f)"$(
		command git \
			for-each-ref \
				--sort=-committerdate \
				--format='%(refname:short)' \
				refs/heads \
			2> /dev/null
	)"})

	_describe 'branch' branches
}
compdef _gwt gwt
