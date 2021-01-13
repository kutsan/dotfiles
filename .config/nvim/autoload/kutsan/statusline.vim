scriptencoding UTF-8

function! kutsan#statusline#linter() abort
  if !exists('g:did_coc_loaded')
    return ''
  endif

  if get(get(b:, 'coc_diagnostic_info', {}), 'error', v:null)
    \ || get(get(b:, 'coc_diagnostic_info', {}), 'warning', v:null)
    return '•'
  else
    return ''
  endif
endfunction

function! kutsan#statusline#fileprefix() abort
  let l:basename = expand('%:h')

  if l:basename ==# '' || l:basename ==# '.'
    return ''
  else
    return substitute(l:basename .. '/', '\C^' .. $HOME, '~', '')
  endif
endfunction

function! kutsan#statusline#hlsearch() abort
  if !&hlsearch
    return ''
  endif

  return '' .. ' '
endfunction

function! kutsan#statusline#spell() abort
  if !&spell
    return ''
  endif

  return '' .. ' '
endfunction

function! kutsan#statusline#markdownpreview() abort
  if !exists('b:markdownpreview')
    return ''
  endif

  return '' .. ' '
endfunction
