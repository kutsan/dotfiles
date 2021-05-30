function! kutsan#statusline#linter(severity) abort
  if luaeval(printf('vim.lsp.diagnostic.get_count(0, "%s")', a:severity))
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
