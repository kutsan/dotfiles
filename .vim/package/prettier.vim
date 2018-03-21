" Code formatter prettier integration.
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['html', 'css', 'sass', 'javascript', 'javascript.jsx', 'json', 'graphql'] }

" Disable errors to being show in quickfix window.
let g:prettier#quickfix_enabled = v:false

" Disable autoformatting upon saving.
let g:prettier#autoformat = v:false

" Use prettier in asynchronous mode.
let g:prettier#exec_cmd_async = v:true

augroup prettier
	autocmd!
	autocmd FileType html,css,sass,javascript,javascript.jsx,json,graphql
		\ nnoremap <buffer><silent> <LocalLeader>f :Prettier<Enter>
augroup end
