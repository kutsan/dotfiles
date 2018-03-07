if !has('nvim') || !has('python3')
	finish
endif

" Asynchronous auto-completion framework for neovim.
Plug 'roxma/nvim-completion-manager'

" Go next and previous completion.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
