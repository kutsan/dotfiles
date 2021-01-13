""
" Search and replace operator.
"
" nnoremap <silent> gy :set operatorfunc=kutsan#mappings#operator#searchreplace#<CR>g@
" xnoremap <silent> gy :<C-u>call kutsan#mappings#operator#searchreplace#(visualmode())<CR>
"
" @param {string} [type] Type of motion.
""
function! kutsan#mappings#operator#searchreplace#(type) abort
  " The operator doesn't support line-wise and block-wise motions.
  if index(['line', 'block', 'V', "\<C-v>"], a:type) !=# -1
    return v:false
  endif

  let l:save = {
    \ 'register': getreg('@')
  \ }

  if a:type ==# 'char'
    silent normal! `[v`]y
  elseif a:type ==# 'v'
    silent normal! gvy
  endif

  let l:query = getreg('@')
  call setreg('@', l:save.register)
  unlet l:save

  if line("'[") !=# line("']")
    return v:false
  endif

  let @/ = escape(l:query, '/\')

  call feedkeys(printf(':%%substitute/\v<%s>//gc', @/), 'n')
  call feedkeys("\<Left>\<Left>\<Left>", 'm')
endfunction
