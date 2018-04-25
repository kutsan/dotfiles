" Emmet integration.
Plug 'mattn/emmet-vim', { 'on': 'EmmetInstall' }

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

" Override default settings.
let g:user_emmet_settings = {
	\ 'javascript.jsx': { 'extends': 'jsx' }
\ }

" Automatically activate Emmet for following filetypes.
augroup emmetsetup
	autocmd!
	autocmd FileType html,css,sass,javascript.jsx EmmetInstall
augroup end
