local luasnip = require('luasnip')
local keymap = vim.keymap

local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node

luasnip.add_snippets('ledger', {
  snippet({
    trig = 'add',
    name = 'add',
    dscr = 'Add new journal entry',
    docstring = {
      string.format('%s description', os.date('%Y-%m-%d')),
      'account  value currency',
      'account',
    },
  }, {
    text_node(('%s '):format(os.date('%Y-%m-%d'))),
    insert_node(1, 'description'),
    text_node({ '', '  ' }),
    insert_node(2, 'account'),
    text_node('  '),
    insert_node(3, 'value'),
    text_node(' '),
    insert_node(4, 'currency'),
    text_node({ '', '  ' }),
    insert_node(5, 'account'),
  }),
})

keymap.set('i', '<C-j>', '<Plug>luasnip-expand-or-jump')
keymap.set('s', '<C-j>', '<Plug>luasnip-expand-or-jump')
keymap.set('i', '<C-k>', '<Plug>luasnip-jump-prev')
keymap.set('s', '<C-k>', '<Plug>luasnip-jump-prev')
