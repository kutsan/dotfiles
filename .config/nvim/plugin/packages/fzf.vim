" Add prefix to commands for grouping.
let g:fzf_command_prefix = 'Fzf'

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

" Define key mappings.
nnoremap <silent> <C-p> :FzfGFiles<CR>
nnoremap <silent> gis :FzfGFiles?<CR>
nnoremap <silent> <Leader><C-p> :FzfFiles<CR>
nnoremap <silent> <M-x> :FzfCommands<CR>
nnoremap <silent> <C-b> :FzfBuffers<CR>
nnoremap <silent> <C-f> :FzfBTags<CR>
nnoremap <silent> <Leader><C-f> :FzfTags<CR>
nnoremap <silent> <Leader>h :FzfHelptags<CR>
nnoremap <silent> <Leader>: :FzfHistory:<CR>
nnoremap <silent> <Leader>/ :FzfHistory/<CR>
nnoremap <silent> <Leader>` :FzfMarks<CR>
nnoremap <silent> g<C-p> :call fzf#run(
  \ fzf#wrap(
    \ 'projects',
    \ {
    \ 'source': 'ls ~/Projects',
    \ 'dir': '~/Projects',
    \ 'sink': {dir -> execute([printf('cd %s', dir), printf('edit %s', dir)])},
    \ 'options': '--no-multi --prompt="> "'
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
