if !exists('$FZF_HOME')
	finish
endif

" Load core fzf functions from $FZF_HOME.
if system('uname --operating-system') !~# 'Android'
	Plug $FZF_HOME
endif

" Fuzzy finder fzf as Vim plugin.
Plug 'junegunn/fzf.vim'

" Add prefix 'Fzf' commands for grouping.
let g:fzf_command_prefix = 'Fzf'

" Jump to the existing window if possible.
let g:fzf_buffers_jump = 1

" Directly execute the command without appending anything.
let g:fzf_commands_expect = 'alt-enter'

" History directory.
let g:fzf_history_dir =
	\ exists('$XDG_DATA_HOME') && isdirectory($XDG_DATA_HOME)
	\ 	? $XDG_DATA_HOME . '/fzf/'
	\ 	: expand('$HOME') . '/.local/share/fzf/'

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

" Disable status line for fzf buffers.
if has('nvim') || has('gui_running')
	augroup fzfdisablestatusline
		autocmd! FileType fzf
		autocmd  FileType fzf set laststatus=0 | autocmd BufLeave <buffer> set laststatus=2
	augroup end
endif
