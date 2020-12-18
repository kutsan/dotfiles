" Add prefix 'Fzf' commands for grouping.
let g:fzf_command_prefix = 'F'

" Jump to the existing window if possible.
let g:fzf_buffers_jump = v:true

" Directly execute the command without appending anything.
let g:fzf_commands_expect = 'alt-enter'

" Enable preview window.
let g:fzf_preview_window = 'down:60%'

" Set custom layout.
let g:fzf_layout = {
	\ 'window': 'call g:FzfFloatingWindow()'
\ }

" Set actions manually.
let g:fzf_action = {
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit',
	\ 'ctrl-t': 'tab split'
\ }

" History directory.
let g:fzf_history_dir = $HOME .. '/.config/nvim/cache/share/fzf/'

" Define key mappings.
nnoremap <silent> <C-p> :FGFiles<CR>
nnoremap <silent> gis :FGFiles?<CR>
nnoremap <silent> <Leader><C-p> :FFiles<CR>
nnoremap <silent> <M-x> :FCommands<CR>
nnoremap <silent> <C-b> :FBuffers<CR>
nnoremap <silent> <C-f> :FBTags<CR>
nnoremap <silent> <Leader><C-f> :FTags<CR>
nnoremap <silent> <Leader>h :FHelptags<CR>
nnoremap <silent> <Leader>: :FHistory:<CR>
nnoremap <silent> <Leader>/ :FHistory/<CR>
nnoremap <silent> <Leader>` :FMarks<CR>
nnoremap <silent> g<C-p> :call fzf#run(
	\ fzf#wrap(
		\ 'projects',
		\ {
		\	'source': 'ls ~/Projects',
		\	'dir': '~/Projects',
		\	'sink': {dir -> execute(printf('silent edit %s', dir))},
		\	'options': '--no-multi --prompt="> "'
		\ },
		\ 0
	\ )
\ )<CR>

function! g:FzfFloatingWindow() abort
	call nvim_open_win(
		\ nvim_create_buf(v:false, v:true),
		\ v:true,
		\ {
			\ 'relative': 'editor',
			\ 'row': 2,
			\ 'col': (&columns - (&columns * 0.65)) / 2,
			\ 'width': float2nr(&columns * 0.65),
			\ 'height': float2nr(&lines * 0.9),
			\ 'style': 'minimal'
		\ }
	\ )
endfunction
