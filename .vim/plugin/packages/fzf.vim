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

" Customize `fzf` options.
let $FZF_DEFAULT_OPTS='--layout=reverse --margin=1,4 --color=dark,fg:7,bg:-1,hl:4,fg+:15,bg+:-1,hl+:4,info:-1,prompt:0,pointer:12,marker:4,spinner:11,header:-1'

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
	let l:buf = nvim_create_buf(v:false, v:true)
	call setbufvar(l:buf, '&signcolumn', 'no')

	let l:height = float2nr(20)
	let l:width = float2nr(80)
	let l:horizontal = float2nr((&columns - l:width) / 2)
	let l:vertical = 5

	let l:opts = {
		\ 'relative': 'editor',
		\ 'row': l:vertical,
		\ 'col': l:horizontal,
		\ 'width': l:width,
		\ 'height': l:height,
		\ 'style': 'minimal'
	\ }

	call nvim_open_win(l:buf, v:true, l:opts)
endfunction
