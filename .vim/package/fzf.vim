" Fuzzy finder fzf as Vim plugin.
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Add prefix 'Fzf' commands for grouping.
let g:fzf_command_prefix = 'F'

" Jump to the existing window if possible.
let g:fzf_buffers_jump = 1

" Directly execute the command without appending anything.
let g:fzf_commands_expect = 'alt-enter'

" Set custom layout.
let g:fzf_layout = {
	\ 'window': 'silent 18split enew'
\ }

" Set actions manually.
let g:fzf_action = {
	\ 'ctrl-e': 'split',
	\ 'ctrl-v': 'vsplit'
\ }

" History directory.
let g:fzf_history_dir =
	\ exists('$XDG_DATA_HOME') && isdirectory($XDG_DATA_HOME)
		\ ? $XDG_DATA_HOME . '/fzf/'
		\ : $HOME . '/.local/share/fzf/'

" Customize `fzf` colors to match current color scheme.
let g:fzf_colors = {
	\ 'fg': ['fg', 'Normal'],
	\ 'bg': ['bg', 'Normal'],
	\ 'hl': ['fg', 'Comment'],
	\ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+': ['fg', 'Statement'],
	\ 'info': ['fg', 'Comment'],
	\ 'border': ['fg', 'Ignore'],
	\ 'prompt': ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker': ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header': ['fg', 'Comment']
\ }

" Define key mappings.
nnoremap <silent> <C-p> :FGFiles<Enter>
nnoremap <silent> <Leader><C-p> :FFiles<Enter>
nnoremap <silent> <M-x> :FCommands<Enter>
nnoremap <silent> <Leader><Enter> :FBuffers<Enter>
nnoremap <silent> <Leader>h :FHelptags<Enter>
nnoremap <silent> <Leader>: :FHistory:<Enter>
nnoremap <silent> <Leader>/ :FHistory/<Enter>
nnoremap <silent> <Leader>` :FMarks<Enter>

" Disable status line for fzf buffers.
augroup fzfdisablestatusline
	autocmd!
	autocmd User FzfStatusLine setlocal statusline=\  |
augroup end
