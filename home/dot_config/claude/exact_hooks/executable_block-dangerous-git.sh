#!/usr/bin/env bash
set -euo pipefail

INPUT=$(cat)
COMMAND=$(printf '%s' "$INPUT" | jq -r '.tool_input.command // empty')
[[ -z "$COMMAND" ]] && exit 0

DANGEROUS_PATTERNS=(
	'git[[:space:]]+push'
	'git[[:space:]]+reset[[:space:]]+--hard'
	'git[[:space:]]+clean'
	'git[[:space:]]+filter-branch'
	'git[[:space:]]+filter-repo'
	'git[[:space:]]+reflog[[:space:]]+expire'
	'git[[:space:]]+stash[[:space:]]+clear'
	'git[[:space:]]+stash[[:space:]]+drop'
	'git[[:space:]]+update-ref[[:space:]]+-d'
	'git[[:space:]]+worktree[[:space:]]+remove'
	'git[[:space:]]+branch[[:space:]]+-D'
	'git[[:space:]]+branch[[:space:]]+-d'
	'git[[:space:]]+tag[[:space:]]+-d'
	'git[[:space:]]+remote[[:space:]]+remove'
	'git[[:space:]]+remote[[:space:]]+rm'
	'git[[:space:]]+checkout[[:space:]]+\.'
	'git[[:space:]]+restore[[:space:]]+\.'
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
	if [[ "$COMMAND" =~ $pattern ]]; then
		printf 'BLOCKED: %q matches dangerous pattern %q. The user has prevented you from doing this.\n' \
			"$COMMAND" "$pattern" >&2
		exit 2
	fi
done

exit 0
