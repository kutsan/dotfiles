""
" Emmet integration.
""

" Load optional plugin for appropriate file types.
augroup loademmet
	autocmd!
	autocmd FileType html,css,sass,javascript,javascriptreact
		\ packadd emmet |
		\ EmmetInstall
augroup end

" Change default leader key.
let g:user_emmet_leader_key='<C-e>'

" Disable using default omni complete function.
let g:user_emmet_complete_tag = v:false

" Activate mappings only for Insert mode.
let g:user_emmet_mode = 'i'

" Disable creating Emmet command.
let g:user_emmet_install_command = v:false

" Disable creating global mappings.
let g:user_emmet_install_global = v:false
