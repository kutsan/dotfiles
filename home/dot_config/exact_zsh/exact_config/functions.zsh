# `cd` into the last directory upon exit using `yazi`.
function y() {
	local temp_file="$(mktemp -t "yazi-cwd.XXXXXX")"

	command yazi "$@" --cwd-file="$temp_file"
	local cwd="$(command cat -- "$temp_file")"

	if [[ -n "$cwd" ]] && [[ "$cwd" != "$PWD" ]] {
		builtin cd -- "$cwd"
	}

	command rm -f -- "$temp_file"
}

# Generate authentication keys for SSH.
function gen-ssh-keygen-ed25519() {
	ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/keys/$1 -C "$2"
}

# Create a worktree at `../<project>--<branch>` and cd into it.
function gwt() {
	local branch=$1
	local start_point=${2:-HEAD}

	if [[ -z $branch ]] {
		print -u2 "branch name required"
		return 1
	}

	local common_dir
	common_dir=$(command git rev-parse --path-format=absolute --git-common-dir) || return

	# In a bare repo, common_dir is the repo (e.g. foo.git).
	# Otherwise it's the `.git` dir inside the main worktree.
	local main_worktree

	if [[ $(command git rev-parse --is-bare-repository) == true ]] {
		main_worktree=$common_dir
	} else {
		main_worktree=${common_dir:h}
	}

	local main_name=${main_worktree:t}
	main_name=${main_name%.git}

	local branch_slug=${branch//\//-}
	local parent=${main_worktree:h}

	local worktree_path=$parent/$main_name--$branch_slug

	command git worktree add -b "$branch" "$worktree_path" "$start_point" || return
	builtin cd -- "$worktree_path"
}

# Tab-completion for `gwt`: second arg completes recent git branches.
function _gwt() {
	_arguments \
		':branch name:' \
		':start point:->ref'

	if [[ $state == ref ]] {
		local -a refs=(${(f)"$(
			command git \
				for-each-ref \
					--sort=-committerdate \
					--format='%(refname:short)' \
					refs/heads \
					refs/remotes \
					refs/tags \
				2> /dev/null
		)"})

		_describe 'ref' refs
	}
}
compdef _gwt gwt
