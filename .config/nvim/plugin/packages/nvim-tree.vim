scriptencoding UTF-8

" Set whether or not to show certain icons.
let g:nvim_tree_show_icons = {
  \ 'git': 0,
  \ 'folders': 1,
  \ 'files': 1
\ }

" Customize icons.
let g:nvim_tree_icons = {
  \ 'default': '',
  \ 'symlink': '',
  \ 'git': {
    \ 'unstaged': '',
    \ 'staged': '',
    \ 'unmerged': '',
    \ 'renamed': '',
    \ 'deleted': '',
    \ 'untracked': ''
  \ },
  \ 'folder': {
    \ 'default': '',
    \ 'open': '',
    \ 'symlink': ''
  \ }
\ }

" Highlight nodes according to current git status.
let g:nvim_tree_git_hl = 1

" Automatically close the tree if it's the last remaining window.
let g:nvim_tree_auto_close = 1

" Set key bindings.
let g:nvim_tree_bindings = {
  \ 'edit': 'l',
  \ 'edit_split': '<C-s>',
  \ 'edit_vsplit': '<C-v>',
  \ 'edit_tab': '<C-t>',
  \ 'close_node': 'h',
  \ 'cd': 'L',
  \ 'preview': 'i',
  \ 'create': 'c',
  \ 'remove': 'D',
  \ 'rename': 'r',
  \ 'cut': 'd',
  \ 'copy': 'y',
  \ 'paste': 'p',
  \ 'prev_git_item': '[c',
  \ 'next_git_item': ']c',
\ }

nnoremap <silent> <Leader>f :NvimTreeToggle<CR>
nnoremap <silent> <Leader>F :NvimTreeFindFile<CR>

augroup nvimtreesettings
  autocmd!

  " Set statusline.
  autocmd FileType NvimTree let &l:statusline = ' nvimtree'
augroup end
