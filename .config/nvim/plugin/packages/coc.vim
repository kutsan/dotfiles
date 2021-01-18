scriptencoding UTF-8

" List of extensions.
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-tag',
  \ 'coc-stylelintplus',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-lua'
\ ]

" User configuration.
let g:coc_user_config = {
  \ 'suggest': {
    \ 'maxPreviewWidth': 50,
    \ 'keepCompleteopt': v:true
  \ },
  \ 'diagnostic': {
    \ 'checkCurrentLine': v:true,
    \ 'enableHighlightLineNumber': v:false,
    \ 'errorSign': '•',
    \ 'warningSign': '•',
    \ 'infoSign': '•',
    \ 'hintSign': '•'
  \ },
  \ 'css': {
    \ 'validate': v:false
  \ }
\ }

" Mappings.
nmap <Leader>c* <Plug>(coc-rename)
nmap <Leader>cr <Plug>(coc-refactor)
nmap <Leader>]l <Plug>(coc-diagnostic-next)
nmap <Leader>[l <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>gd <Plug>(coc-definition)
nnoremap <silent> <Leader>K :call CocActionAsync('doHover')<CR>

augroup cocsettings
  autocmd!

  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
