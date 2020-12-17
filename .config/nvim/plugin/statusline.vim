" Add margin to left.
set statusline+=%{repeat('\ ',4)} " Generate space characters given number of times.

" Truncate lines to left if they are too long.
set statusline+=%<

" Relative path to file's directory with trailing '/'.
set statusline+=%{kutsan#statusline#fileprefix()}

" File name for current buffer.
set statusline+=%t

" Linter status.
set statusline+=%{repeat('\ ',1)}
set statusline+=%#diffRemoved#
set statusline+=%{kutsan#statusline#linter()}
set statusline+=%*

" Align all items to right from this point on.
set statusline+=%=

" Show an icon for common options if they are enabled.
set statusline+=%{kutsan#statusline#markdownpreview()}
set statusline+=%{kutsan#statusline#hlsearch()}
set statusline+=%{kutsan#statusline#spell()}
set statusline+=%{repeat('\ ',2)}

" Line numbers and column numbers in <Line>:<Column> format.
set statusline+=%02l/%02L:%02c
set statusline+=%{repeat('\ ',2)}
