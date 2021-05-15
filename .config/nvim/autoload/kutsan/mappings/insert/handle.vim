""
" Cycle through completion items when popup menu is visible, trigger
" completion upon written words.
"
" inoremap <expr> <Tab> kutsan#mappings#insert#handle#tab({ 'key': "\<Tab>" })
" inoremap <expr> <S-Tab> kutsan#mappings#insert#handle#tab({ 'key': "\<S-Tab>" })
"
" @param {dictionary} options Configuration dictionary.
" @param {string} options.key Key to use, whether "\<Tab>" or "\<S-Tab>".
""
function! kutsan#mappings#insert#handle#tab(options) abort
  if !pumvisible()
    " If there is nothing before cursor, perform their original action.
    if !(col('.') - 1) || getline('.')[col('.') - 2] =~# '\s'
      return a:options.key

    " Trigger completion upon written words.
    else
      if exists('g:did_coc_loaded')
        return coc#refresh()
      endif
    endif
  endif

  if a:options.key ==# "\<Tab>"
    return "\<C-n>"
  elseif a:options.key ==# "\<S-Tab>"
    return "\<C-p>"
  endif
endfunction
