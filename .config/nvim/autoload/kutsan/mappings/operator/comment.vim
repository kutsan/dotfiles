""
" Comment and uncomment block of texts.
" Modified version of @tpope's commentary plugin.
"
" nnoremap <silent> gc :<C-u>set operatorfunc=kutsan#mappings#operator#comment#<CR>g@
" xnoremap <silent> gc :<C-u>call kutsan#mappings#operator#comment#(visualmode())<CR>
"
" @param {string} type Type of motion.
""
function! kutsan#mappings#operator#comment#(type) abort
  if index(['v', 'V', "\<C-v>"], a:type) !=# -1
    let [l:mstart, l:mend] = [line("'<"), line("'>")]
  elseif index(['char', 'line', 'block'], a:type) !=# -1
    let [l:mstart, l:mend] = [line("'["), line("']")]
  endif

  let l:uncomment = 2

  let [l:leftcommentstring, l:rightcommentstring] =
    \ split(
      \ substitute(
        \ substitute(
          \ &commentstring,
          \ '\S\zs%s',
          \ ' %s',
          \ ''
        \ ),
        \ '%s\ze\S',
        \ '%s ',
        \ ''
      \ ),
      \ '%s',
      \ v:true
    \ )

  for l:linenumber in range(l:mstart, l:mend)
    let l:line = matchstr(getline(l:linenumber), '\S.*\s\@<!')

    " Trim trailing whitespace characters.
    if l:leftcommentstring[-1:] ==# ' '
        \ && stridx(l:line, l:leftcommentstring) == -1
        \ && stridx(l:line, l:leftcommentstring[0:-2]) == 0
      let l:leftcommentstring = l:leftcommentstring[:-2]
    endif
    if l:rightcommentstring[0] ==# ' '
        \ && l:line[-strlen(l:rightcommentstring):] != l:rightcommentstring
        \ && l:line[1-strlen(l:rightcommentstring):] == l:rightcommentstring[1:]
      let l:rightcommentstring = l:rightcommentstring[1:]
    endif

    if l:line !=# ''
        \ && (stridx(l:line, l:leftcommentstring)
        \ || l:line[strlen(l:line)-strlen(l:rightcommentstring) : -1] != l:rightcommentstring)
      let l:uncomment = v:false
    endif
  endfor

  for l:linenumber in range(l:mstart, l:mend)
    let l:line = getline(l:linenumber)

    if strlen(l:rightcommentstring) > 2
        \ && l:leftcommentstring .. l:rightcommentstring !~# '\\'
      let l:line = substitute(
        \ l:line,
        \ printf(
          \ '\M%s\zs\d\*\ze%s\|%s\zs\d\*\ze%s',
          \ l:rightcommentstring[0:-2],
          \ l:rightcommentstring[-1:-1],
          \ l:leftcommentstring[0],
          \ l:leftcommentstring[1:-1]
        \ ),
        \ '\=substitute(submatch(0) + 1 - l:uncomment, "^0$\\|^-\\d*$", "", "")',
        \ 'g'
      \ )
    endif

    if l:uncomment
      let l:line = substitute(
        \ l:line,
        \ '\S.*\s\@<!',
        \ '\=submatch(0)[strlen(l:leftcommentstring):-strlen(l:rightcommentstring)-1]',
        \ ''
      \ )
    else
      let l:line = substitute(
        \ l:line,
        \ printf(
          \ '^\%(%s\|\s*\)\zs.*\S\@<=',
          \ matchstr(getline(l:mstart), '^\s*')
        \ ),
        \ '\=l:leftcommentstring .. submatch(0) .. l:rightcommentstring',
        \ ''
      \ )
    endif

    call setline(l:linenumber, l:line)
  endfor
endfunction
