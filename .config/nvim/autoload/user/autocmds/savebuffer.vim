""
" Save the current buffer while keeping marks.
"
" autocmd InsertLeave,TextChanged * call user#autocmds#savebuffer#()
""
function! user#autocmds#savebuffer#() abort
  if empty(&buftype)
    \ && !empty(bufname(''))
    \ && &filetype !=# 'gitcommit'
    let l:save = {
      \ 'marks': {
        \ "'[": getpos("'["),
        \ "']": getpos("']")
      \ }
    \ }

    silent! update

    for [l:key, l:value] in items(l:save.marks)
      call setpos(l:key, l:value)
    endfor
  endif
endfunction
