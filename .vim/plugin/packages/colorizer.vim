""
" Highlight HEX and RGB color codes and names in their background.
""

" Load optional plugin for appropriate file types.
augroup loadcolorizer
	autocmd!
	autocmd Filetype html,css,sass,javascript
		\ packadd! colorizer |
		\ call Colorizer#LocalFTAutoCmds(v:true) |
		\ call Colorizer#DoColor(v:false, 0, line('$'))
augroup end

" Skip comments from being colored.
let g:colorizer_skip_comments = v:true

" Disable highlighting color names.
let g:colorizer_colornames = v:false
