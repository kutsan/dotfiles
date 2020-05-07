" Define 'formatprg'.
if !empty(glob('node_modules/stylelint/bin/stylelint.js'))
	let &l:formatprg = 'node_modules/stylelint/bin/stylelint.js --stdin --fix 2>/dev/null'
endif
