scriptencoding UTF-8

" Disable built-in statusline.
let g:qf_disable_statusline = v:true

" Set statusline.
setlocal statusline=%{repeat('\ ',4)} " Generate space characters given number of times.
setlocal statusline+= " Show a custom list icon.
setlocal statusline+=%{repeat('\ ',1)}
setlocal statusline+=%t " File name, either [Quickfix List] or [Location List].
setlocal statusline+=%{exists('w:quickfix_title')?'\ '..w:quickfix_title:''}
setlocal statusline+=%= " Align all items to right from this point on.
setlocal statusline+=%{repeat('\ ',1)}
setlocal statusline+=%l/%L " Current line number and total item count.
setlocal statusline+=%{repeat('\ ',1)}
