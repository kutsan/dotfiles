Plug 'suan/vim-instant-markdown', { 'on': 'InstantMarkdownPreview' }

" Don't start the daemon automatically.
let g:instant_markdown_autostart = 0

augroup instantmarkdownpreview
	autocmd!
	autocmd FileType markdown nnoremap <buffer> <LocalLeader>r :InstantMarkdownPreview<Enter>
augroup end
