""
" `gq` wrapper that formats without moving cursor.
"
" nnoremap <silent> gq :let w:gqview = winsaveview()<CR>:set opfunc=kutsan#mappings#operator#format#gq<CR>g@
" xnoremap <silent> gq :<C-u>call kutsan#mappings#operator#format#gq(visualmode())<CR>
""
function! kutsan#mappings#operator#format#gq(type) abort
  if index(['v', 'V', "\<C-v>"], a:type) >= 0
    silent normal! gvgq
  else
    silent execute printf("'[,']!%s", &l:formatprg)
  endif

  if v:shell_error > 0
    let l:formaterror = join(getline(line("'["), line("']")), "\n")
    silent undo

    echoerr l:formaterror
  endif

  if exists('w:gqview')
    call winrestview(w:gqview)
    unlet w:gqview
  endif
endfunction

""
" Use alternate 'formatprg' `par` via `gQ`.
"
" nnoremap <silent> gQ :let w:gQview = winsaveview()<CR>:set opfunc=kutsan#mappings#operator#format#gQ<CR>g@
" xnoremap <silent> gQ :<C-u>call kutsan#mappings#operator#format#gQ(visualmode())<CR>
""
function! kutsan#mappings#operator#format#gQ(type) abort
  let l:save = {
    \ 'formatprg': &l:formatprg
  \ }

  let &l:formatprg = 'par b1 e1 g1 q1 r3 w80 R1 T4 B=.,\?_A_a Q=_s\>'

  if index(['v', 'V', "\<C-v>"], a:type) >= 0
    silent normal! gvgq
  else
    silent execute printf("'[,']!%s", &l:formatprg)
  endif

  if v:shell_error > 0
    let l:formaterror = join(getline(line("'["), line("']")), "\n")
    silent undo

    echoerr l:formaterror
  endif

  if exists('w:gQview')
    call winrestview(w:gQview)
    unlet w:gQview
  endif

  let &l:formatprg = l:save.formatprg
  unlet l:save
endfunction
