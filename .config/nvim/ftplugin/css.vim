" Add '-' to 'iskeyword' list.
setlocal iskeyword+=-

" Define 'formatprg'.
if !empty(glob('node_modules/stylelint/bin/stylelint.js'))
	let &l:formatprg = 'node_modules/stylelint/bin/stylelint.js --stdin --fix'
endif
