""
" Allow indented text blocks to be treated as text objects.
""
function! user#indent#(options) abort
  let l:save = {
    \ 'marks': {
      \ "'[": getpos("'["),
      \ "']": getpos("']")
    \ }
  \ }

  normal! ^
  let l:virtcol = virtcol(getline('.') =~# '\v\c^\s*$' ? '$' : '.')

  " Don't select entire buffer if no indentation found at current position.
  if l:virtcol ==# 1
    return v:false
  endif

  let l:pattern = printf('\v\c^(\s*%%%sv|^$)@!', l:virtcol)
  let l:start = search(l:pattern, 'bWn') + 1
  let l:end = search(l:pattern, 'Wn') - 1

  " Exclude or include empty lines depending on mode.
  if a:options.mode ==# 'a'
    execute printf('normal! %sG0V%sG$', l:start, l:end)

  elseif a:options.mode ==# 'i'
    execute printf('normal! %sG0', l:start)
    call search('\v\c^[^\n\r]', 'Wc')

    execute printf('normal! Vo%sG', l:end)
    call search('\v\c^[^\n\r]', 'bWc')

    normal! 0

  elseif a:options.mode ==# 'o'
    execute printf('normal! %sG0V%sG$', l:start - 1, l:end + 1)
  endif

  for [l:key, l:value] in items(l:save.marks)
    call setpos(l:key, l:value)
  endfor
endfunction
