Plug 'suan/vim-instant-markdown', { 'on': 'InstantMarkdownPreview' }

" Don't start the daemon automatically.
let g:instant_markdown_autostart = v:false

augroup instantmarkdownpreview
	autocmd!
	autocmd FileType markdown nnoremap <buffer><silent> <LocalLeader>r :InstantMarkdownPreview<Enter>
augroup end
