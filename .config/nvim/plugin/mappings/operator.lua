local keymap = vim.keymap

-- Comment and uncomment operator.
keymap.set(
  'n',
  'gc',
  '<Cmd>set operatorfunc=kutsan#mappings#operator#comment#<CR>g@',
  {
    silent = true,
  }
)
keymap.set(
  'x',
  'gc',
  ':<C-u>call kutsan#mappings#operator#comment#(visualmode())<CR>',
  {
    silent = true,
  }
)
