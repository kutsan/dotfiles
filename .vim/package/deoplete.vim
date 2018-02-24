if !has('nvim') || !has('python3')
	finish
endif

" Asynchronous auto-completion framework for neovim.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Enable at start.
let g:deoplete#enable_at_startup = 1

" Go next and previous completion with <Tab> and <S-Tab> when completion available.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" <C-h> and Backspace close pop-up and delete backward char.
inoremap <expr> <C-h> deoplete#smart_close_popup() . "\<C-h>"
inoremap <expr> <BS> deoplete#smart_close_popup() . "\<C-h>"
