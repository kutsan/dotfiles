" Snippet engine.
Plug 'Shougo/neosnippet.vim'

" Use ~/.vim/snippet directory for snippets.
let g:neosnippet#snippets_directory = expand('$HOME') . '/.vim/snippet'

" Disable all built-in snippets.
let g:neosnippet#disable_runtime_snippets = { '_': v:true }
