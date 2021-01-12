" Add '-' to 'iskeyword' list.
setlocal iskeyword+=-

" Define 'formatprg'.
let &l:formatprg = 'node_modules/.bin/stylelint --stdin --fix'
