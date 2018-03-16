" Set 'filetype' to 'javascript.jsx' if file contains 'import React'.
autocmd BufNewFile,BufRead *.js
	\ if kutsan#ftdetect#contains('\v\C^import\sReact', { 'maxline': 20 }) |
		\ set filetype=javascript.jsx |
	\ endif
