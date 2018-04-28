scriptencoding UTF-8

" Disable built-in ftplugin.
let b:did_ftplugin = v:true

" Disable relative numbers and use just numbers.
setlocal norelativenumber
setlocal number

" Use custom fold expression.
setlocal foldmethod=expr
setlocal foldexpr=kutsan#ftplugin#qf#foldexpr(v:lnum)

" Use custom foldtext.
setlocal foldtext=kutsan#ftplugin#qf#foldtext()

" Start with all folds open.
setlocal foldlevel=99

" Make quickfix buffer hidden.
setlocal nobuflisted

" Set statusline.
setlocal statusline=%{repeat('\ ',4)} " Generate space characters given number of times.
setlocal statusline+= " Show a custom list icon.
setlocal statusline+=%{repeat('\ ',1)}
setlocal statusline+=%t " File name, either [Quickfix List] or [Location List].
setlocal statusline+=%= " Align all items to right from this point on.
setlocal statusline+=%{repeat('\ ',1)}
setlocal statusline+=%l/%L " Current line number and total item count.
setlocal statusline+=%{repeat('\ ',1)}
