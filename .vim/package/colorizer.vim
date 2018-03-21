" Highlight HEX and RGB color codes and names in their background.
Plug 'chrisbra/Colorizer', { 'for': ['html', 'css', 'sass', 'javascript', 'javascript.jsx'] }

" Automatically enable highlighting in certain file types.
let g:colorizer_auto_filetype = 'html,css,sass,javascript,javascript.jsx'

" Skip comments from being colored.
let g:colorizer_skip_comments = v:true

" Disable highlighting color names.
let g:colorizer_colornames = v:false
