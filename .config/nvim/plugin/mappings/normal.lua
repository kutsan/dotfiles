local map = require('kutsan/utils').map

-- Quickly close current window.
map('n', '<Space>q', '<Cmd>quit<CR>', { silent = true })

-- Pane nagivation.
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')

-- Always search with 'very magic' mode.
map('n', '/', '/\\v')
map('n', '?', '?\\v')

-- Override Ex mode with run @q.
map('n', 'Q', '@q')

-- Always send contents of a `x` command to the black hole register.
map('n', 'x', '"_x')

-- Go to the alternate buffer.
map('n', '<C-n>', '<C-^>')

-- Refactor word under cursor.
map('n', 'c*', "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgn")
map('n', 'c#', "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgN")

-- Refactor symbol under cursor with LSP.
map(
  'n',
  '<Space>c*',
  "<Cmd>lua require('kutsan/mappings/normal/rename').open_rename_window()<CR>",
  { silent = true }
)

-- Reveal syntax group under cursor.
map(
  'n',
  '<F10>',
  "<Cmd>lua require('kutsan/mappings/normal/syntax').reveal_syntax_group()<CR>",
  { silent = true }
)

-- Scroll viewport faster.
map('n', '<C-e>', '3<C-e>')
map('n', '<C-y>', '3<C-y>')

-- Resize current window sizes.
map('n', '<S-Up>', '2<C-w>+')
map('n', '<S-Down>', '2<C-w>-')
map('n', '<S-Right>', '2<C-w>>')
map('n', '<S-Left>', '2<C-w><')

-- Toggle floating terminal or create new one if there is none.
map(
  't',
  '<C-z>',
  "<Cmd>lua require('kutsan/mappings/normal/terminal').toggle()<CR>",
  { silent = true }
)
map(
  'n',
  '<C-z>',
  "<Cmd>lua require('kutsan/mappings/normal/terminal').toggle()<CR>",
  { silent = true }
)

-- Remove current buffer without losing window layout.
map(
  'n',
  '\\q',
  "<Cmd>lua require('kutsan/mappings/normal/bufremove').bufremove({ force = false })<CR>",
  { silent = true }
)
map(
  'n',
  '\\Q',
  "<Cmd>lua require('kutsan/mappings/normal/bufremove').bufremove({ force = true })<CR>",
  { silent = true }
)

-- Add [count] blank lines above or below the cursor.
map(
  'n',
  '[<Space>',
  "<Cmd>put! =repeat(nr2char(10), v:count1) <Bar> ']+1<CR>",
  { silent = true }
)
map(
  'n',
  ']<Space>',
  "<Cmd>put =repeat(nr2char(10), v:count1) <Bar> '[-1<CR>",
  { silent = true }
)

-- Open URL under cursor in browser or open path in GUI explorer.
map(
  'n',
  'gb',
  "<Cmd>lua vim.cmd(string.format('silent !open \"%s\"', vim.fn.escape(vim.fn.expand('<cfile>'), '#%!')))<CR>",
  { silent = true }
)

-- Toggle common options.
map('n', 'cos', '<Cmd>set spell!<CR>', { silent = true })
map('n', 'cow', '<Cmd>set wrap!<CR>', { silent = true })
map('n', 'coh', '<Cmd>nohlsearch<CR>', { silent = true })
map('n', 'coH', '<Cmd>set hlsearch!<CR>', { silent = true })

-- Jump to a tag directly when there is only one match.
map('n', '<C-]>', 'g<C-]>zt')

-- Go previous and next location list entry.
map('n', '[l', '<Cmd>labove<CR>', { silent = true })
map('n', ']l', '<Cmd>lbelow<CR>', { silent = true })

-- Go previous and next buffers in buffer list.
map('n', '<M-p>', '<Cmd>bprevious<CR>', { silent = true })
map('n', '<M-n>', '<Cmd>bnext<CR>', { silent = true })

-- Quickfix navigation mappings.
map('n', '<Up>', '<Cmd>cprevious<CR>zz', { silent = true })
map('n', '<Down>', '<Cmd>cnext<CR>zz', { silent = true })
map('n', '<Left>', '<Cmd>cpfile<CR>zz', { silent = true })
map('n', '<Right>', '<Cmd>cnfile<CR>zz', { silent = true })

-- Select last changed or yanked area.
map('n', 'gV', "'`[' .. strpart(getregtype(), 0, 1) .. '`]'", { expr = true })
