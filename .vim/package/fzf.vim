" Fuzzy finder fzf as Vim plugin.
Plug $FZF_HOME | Plug 'junegunn/fzf.vim'

" Add prefix 'Fzf' commands for grouping.
let g:fzf_command_prefix = 'Fzf'

" Jump to the existing window if possible.
let g:fzf_buffers_jump = 1

" History directory.
let g:fzf_history_dir = $XDG_DATA_HOME . '/fzf/'

" Customize `fzf` colors to match current color scheme.
let g:fzf_colors = {
	\ 'fg': ['fg', 'Normal'],
	\ 'bg': ['bg', 'Normal'],
	\ 'hl': ['fg', 'Comment'],
	\ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+': ['fg', 'Statement'],
	\ 'info': ['fg', 'PreProc'],
	\ 'border': ['fg', 'Ignore'],
	\ 'prompt': ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker': ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header': ['fg', 'Comment']
\ }

" Define key mappings.
nnoremap <silent> <C-p> :FzfGFiles<Enter>
nnoremap <silent> <M-x> :FzfCommands<Enter>
nnoremap <silent> <M-b> :FzfBuffers<Enter>
nnoremap <silent> <Leader>h :FzfHelptags<Enter>
nnoremap <silent> <Leader>; :FzfHistory:<Enter>
nnoremap <silent> <Leader>/ :FzfHistory/<Enter>
nnoremap <silent> <Leader>m :FzfMarks<Enter>

" Empty status line for fzf buffers.
augroup fzfdisablestatusline
	autocmd!
	autocmd User FzfStatusLine
		\ highlight FzfReset guifg=bg |
		\ setlocal statusline=%#FzfReset#\  |
augroup end
