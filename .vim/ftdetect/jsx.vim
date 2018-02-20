autocmd BufNewFile,BufRead *.js
	\ if kutsan#utils#contains('\v\Cimport\sReact', 20) |
	\	set filetype=javascript.jsx |
	\ endif
