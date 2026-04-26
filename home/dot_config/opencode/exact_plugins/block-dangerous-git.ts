const DANGEROUS_PATTERNS: RegExp[] = [
	/git\s+push/,
	/git\s+reset\s+--hard/,
	/git\s+clean/,
	/git\s+filter-branch/,
	/git\s+filter-repo/,
	/git\s+reflog\s+expire/,
	/git\s+stash\s+clear/,
	/git\s+stash\s+drop/,
	/git\s+update-ref\s+-d/,
	/git\s+worktree\s+remove/,
	/git\s+branch\s+-D/,
	/git\s+branch\s+-d/,
	/git\s+tag\s+-d/,
	/git\s+remote\s+remove/,
	/git\s+remote\s+rm/,
	/git\s+checkout\s+\./,
	/git\s+restore\s+\./,
]

export async function BlockDangerousGit() {
	return {
		'tool.execute.before': async (
			input: { tool: string },
			output: { args: { command?: string } },
		) => {
			if (input.tool !== 'bash') {
				return
			}

			const command = output.args?.command

			if (command === undefined) {
				return
			}

			for (const pattern of DANGEROUS_PATTERNS) {
				if (pattern.test(command)) {
					throw new Error(
						`BLOCKED: '${command}' matches dangerous pattern '${pattern.source}'. The user has prevented you from doing this.`,
					)
				}
			}
		},
	}
}
