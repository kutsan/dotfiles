" Emmet integration.
Plug 'mattn/emmet-vim', { 'on': 'EmmetInstall' }

" Disable using default omni complete function.
let g:user_emmet_complete_tag = v:false

" Disable creating global mappings.
let g:user_emmet_install_global = v:false

" Override default settings.
let g:user_emmet_settings = {
	\ 'javascript.jsx' : { 'extends': 'jsx' }
\ }

" Automatically activate Emmet in following file types.
augroup emmetsetup
	autocmd!
	autocmd FileType html,css,sass,javascript.jsx EmmetInstall
	autocmd FileType html,css,sass,javascript.jsx imap <expr> <Tab> emmet#expandAbbrIntelligent("\<Tab>")
augroup end
