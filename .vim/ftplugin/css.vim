" Define 'formatprg'.
if !empty(glob('node_modules/stylelint/bin/stylelint.js'))
	let &l:formatprg = 'node_modules/stylelint/bin/stylelint.js --stdin --fix 2>/dev/null'
endif

" Format whole file using `gq` wrapper and `[a]n [e]ntire` operator.
nmap <buffer><silent> <LocalLeader>f gqae
