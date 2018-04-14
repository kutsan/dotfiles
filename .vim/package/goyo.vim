" Distraction-free writing, zen mode.
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Toggle Goyo.
nnoremap <silent> gZ :Goyo<Enter>

" Handlers to use when entering and leaving Goyo.
augroup goyohandlers
	autocmd!
	autocmd! User GoyoEnter call <SID>goyoenterhandler()
	autocmd! User GoyoLeave call <SID>goyoleavehandler()
augroup end

function! s:goyoenterhandler() abort
	" Reenable signify plugin.
	if exists('g:loaded_signify') && g:loaded_signify
		SignifyEnable
	endif
endfunction

function! s:goyoleavehandler() abort
endfunction
