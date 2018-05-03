""
" Snippet engine.
""

" Load optional plugin for appropriate file types.
augroup loadneosnippet
	autocmd!
	autocmd FileType javascript,vim packadd neosnippet
augroup end

" Use ~/.vim/snippet directory for snippets.
let g:neosnippet#snippets_directory = $HOME . '/.vim/snippet'

" Disable all built-in snippets.
let g:neosnippet#disable_runtime_snippets = { '_': v:true }
