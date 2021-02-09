" List of extensions.
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-stylelintplus',
  \ 'coc-lua',
  \ 'coc-vimlsp',
  \ 'coc-emmet'
\ ]

" User configuration.
let g:coc_user_config = {
  \ 'coc.preferences': {
    \ 'messageLevel': 'warning'
  \ },
  \ 'suggest': {
    \ 'maxPreviewWidth': 50,
    \ 'keepCompleteopt': v:true,
    \ 'disableMenu': v:true,
    \ 'completionItemKindLabels': {
      \ 'function': "\uf794",
      \ 'method': "\uf6a6",
      \ 'variable': "\uf71b",
      \ 'constant': "\uf8ff",
      \ 'struct': "\ufb44",
      \ 'class': "\uf0e8",
      \ 'interface': "\ufa52",
      \ 'text': "\ue612",
      \ 'enum': "\uf435",
      \ 'enumMember': "\uf02b",
      \ 'module': "\uf668",
      \ 'color': "\ue22b",
      \ 'property': "\ufab6",
      \ 'field': "\uf93d",
      \ 'unit': "\uf475",
      \ 'file': "\uf471",
      \ 'value': "\uf8a3",
      \ 'event': "\ufacd",
      \ 'folder': "\uf115",
      \ 'keyword': "\uf893",
      \ 'snippet': "\uf64d",
      \ 'operator': "\uf915",
      \ 'reference': "\uf87a",
      \ 'typeParameter': "\uf278",
      \ 'default': "\uf29c"
    \ }
  \ },
  \ 'diagnostic': {
    \ 'format': '%message [%source%code]',
    \ 'checkCurrentLine': v:true,
    \ 'enableHighlightLineNumber': v:false,
    \ 'errorSign': '•',
    \ 'warningSign': '•',
    \ 'infoSign': '•',
    \ 'hintSign': '•'
  \ },
  \ 'snippets': {
    \ 'ultisnips': {
        \ 'directories': ['snippet']
    \ }
  \ },
  \ 'css': {
    \ 'validate': v:false
  \ },
  \ 'stylelintplus': {
      \ 'autoFixOnFormat': v:true
  \ },
  \ 'prettier': {
      \ 'disableLanguages': ['css']
  \ },
\ }

" Mappings.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <Space>c* <Plug>(coc-rename)
nmap <Space>cr <Plug>(coc-refactor)
nmap \f <Plug>(coc-format)
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <silent> <C-f> :CocList outline<CR>
nnoremap <silent> <Space><C-f> :CocList symbols<CR>

augroup cocsettings
  autocmd!

  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " Remove underlines from warnings and errors.
  autocmd User CocNvimInit highlight! CocUnderline cterm=NONE gui=NONE
augroup end
