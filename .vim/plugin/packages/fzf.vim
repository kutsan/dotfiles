""
" Fuzzy finder fzf as Vim plugin.
""

" Add prefix 'Fzf' commands for grouping.
let g:fzf_command_prefix = 'F'

" Jump to the existing window if possible.
let g:fzf_buffers_jump = v:true

" Directly execute the command without appending anything.
let g:fzf_commands_expect = 'alt-enter'

" Set custom layout.
let g:fzf_layout = {
	\ 'window': has('nvim')
		\ ? 'call g:Fzffloatingwindow()'
		\ : 'silent 18split enew'
\ }

" Set actions manually.
let g:fzf_action = {
	\ 'ctrl-e': 'split',
	\ 'ctrl-v': 'vsplit',
	\ 'ctrl-t': 'tab split'
\ }

" History directory.
let g:fzf_history_dir = $HOME . '/.vim/cache/share/fzf/'

" Override `fzf` options.
let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS . " --margin='1,4' --no-inline-info --bold --color='fg+:15,bg+:-1,info:8,prompt:0,pointer:12'"

" Define key mappings.
nnoremap <silent> <C-p> :FGFiles<Enter>
nnoremap <silent> <Leader><C-p> :FFiles<Enter>
nnoremap <silent> <M-x> :FCommands<Enter>
nnoremap <silent> <M-b> :FBuffers<Enter>
nnoremap <silent> <C-f> :FTags<Enter>
nnoremap <silent> <Leader>h :FHelptags<Enter>
nnoremap <silent> <Leader>: :FHistory:<Enter>
nnoremap <silent> <Leader>/ :FHistory/<Enter>
nnoremap <silent> <Leader>` :FMarks<Enter>

function! g:Fzffloatingwindow()
	call nvim_open_win(
		\ nvim_create_buf(v:false, v:true),
		\ v:true,
		\ {
			\ 'relative': 'editor',
			\ 'row': 5,
			\ 'col': (&columns - 80) / 2,
			\ 'width': 80,
			\ 'height': 20,
			\ 'style': 'minimal'
		\ }
	\ )
endfunction
