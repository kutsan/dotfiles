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
  \ 'l': ":lua require('nvim-tree').on_keypress('edit')<CR>",
  \ '<C-s>': ":lua require('nvim-tree').on_keypress('split')<CR>",
  \ '<C-v>': ":lua require('nvim-tree').on_keypress('vsplit')<CR>",
  \ '<C-t>': ":lua require('nvim-tree').on_keypress('tabnew')<CR>",
  \ '<C-r>': ":lua require('nvim-tree').on_keypress('refresh')<CR>",
  \ 'h': ":lua require('nvim-tree').on_keypress('close_node')<CR>",
  \ 'L': ":lua require('nvim-tree').on_keypress('cd')<CR>",
  \ 'i': ":lua require('nvim-tree').on_keypress('preview')<CR>",
  \ 'c': ":lua require('nvim-tree').on_keypress('create')<CR>",
  \ 'D': ":lua require('nvim-tree').on_keypress('remove')<CR>",
  \ 'r': ":lua require('nvim-tree').on_keypress('rename')<CR>",
  \ 'd': ":lua require('nvim-tree').on_keypress('cut')<CR>",
  \ 'y': ":lua require('nvim-tree').on_keypress('copy')<CR>",
  \ 'p': ":lua require('nvim-tree').on_keypress('paste')<CR>",
  \ '[c': ":lua require('nvim-tree').on_keypress('prev_git_item')<CR>",
  \ ']c': ":lua require('nvim-tree').on_keypress('next_git_item')<CR>"
\ }

nnoremap <silent> <Space>f :NvimTreeToggle<CR>
nnoremap <silent> <Space>F :NvimTreeFindFile<CR>

augroup nvimtreesettings
  autocmd!

  " Set statusline.
  autocmd FileType NvimTree let &l:statusline = ' nvimtree'
augroup end
