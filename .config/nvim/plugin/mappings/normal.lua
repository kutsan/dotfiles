local keymap = vim.keymap

-- Quickly close current window.
keymap.set('n', '<Space>q', '<Cmd>quit<CR>', { silent = true })

-- Pane nagivation.
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-l>', '<C-w>l')

-- Always search with 'very magic' mode.
keymap.set('n', '/', '/\\v')
keymap.set('n', '?', '?\\v')

-- Always send contents of a `x` command to the black hole register.
keymap.set('n', 'x', '"_x')

-- Go to the alternate buffer.
keymap.set('n', '<C-n>', '<C-^>')

-- Refactor word under cursor.
keymap.set('n', 'c*', "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgn")
keymap.set('n', 'c#', "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgN")

-- Refactor symbol under cursor with LSP.
keymap.set(
  'n',
  '<Space>c*',
  "<Cmd>lua require('kutsan/mappings/normal/rename').open_rename_window()<CR>",
  { silent = true }
)

-- Reveal syntax group under cursor.
keymap.set(
  'n',
  '<F10>',
  "<Cmd>lua require('kutsan/mappings/normal/syntax').reveal_syntax_group()<CR>",
  { silent = true }
)

-- Scroll viewport faster.
keymap.set('n', '<C-e>', '3<C-e>')
keymap.set('n', '<C-y>', '3<C-y>')

-- Resize current window sizes.
keymap.set('n', '<S-Up>', '2<C-w>+')
keymap.set('n', '<S-Down>', '2<C-w>-')
keymap.set('n', '<S-Right>', '2<C-w>>')
keymap.set('n', '<S-Left>', '2<C-w><')

-- Remove current buffer without losing window layout.
keymap.set(
  'n',
  '\\q',
  "<Cmd>lua require('kutsan/mappings/normal/bufremove').bufremove({ force = false })<CR>",
  { silent = true }
)
keymap.set(
  'n',
  '\\Q',
  "<Cmd>lua require('kutsan/mappings/normal/bufremove').bufremove({ force = true })<CR>",
  { silent = true }
)

-- Add [count] blank lines above or below the cursor.
keymap.set(
  'n',
  '[<Space>',
  "<Cmd>put! =repeat(nr2char(10), v:count1) <Bar> ']+1<CR>",
  { silent = true }
)
keymap.set(
  'n',
  ']<Space>',
  "<Cmd>put =repeat(nr2char(10), v:count1) <Bar> '[-1<CR>",
  { silent = true }
)

-- Open URL under cursor in browser or open path in GUI explorer.
keymap.set(
  'n',
  'gb',
  "<Cmd>lua vim.cmd(string.format('silent !open \"%s\"', vim.fn.escape(vim.fn.expand('<cfile>'), '#%!')))<CR>",
  { silent = true }
)

-- Toggle common options.
keymap.set('n', 'cos', '<Cmd>set spell!<CR>', { silent = true })
keymap.set('n', 'cow', '<Cmd>set wrap!<CR>', { silent = true })
keymap.set('n', 'coh', '<Cmd>nohlsearch<CR>', { silent = true })
keymap.set('n', 'coH', '<Cmd>set hlsearch!<CR>', { silent = true })

-- Jump to a tag directly when there is only one match.
keymap.set('n', '<C-]>', 'g<C-]>zt')

-- Go previous and next location list entry.
keymap.set('n', '[l', '<Cmd>labove<CR>', { silent = true })
keymap.set('n', ']l', '<Cmd>lbelow<CR>', { silent = true })

-- Go previous and next buffers in buffer list.
keymap.set('n', '<M-p>', '<Cmd>bprevious<CR>', { silent = true })
keymap.set('n', '<M-n>', '<Cmd>bnext<CR>', { silent = true })

-- Quickfix navigation mappings.
keymap.set('n', '<Up>', '<Cmd>cprevious<CR>zz', { silent = true })
keymap.set('n', '<Down>', '<Cmd>cnext<CR>zz', { silent = true })
keymap.set('n', '<Left>', '<Cmd>cpfile<CR>zz', { silent = true })
keymap.set('n', '<Right>', '<Cmd>cnfile<CR>zz', { silent = true })

-- Select last changed or yanked area.
keymap.set('n', 'gV', "'`[' .. strpart(getregtype(), 0, 1) .. '`]'", { expr = true })
