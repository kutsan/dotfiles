local map = require('kutsan/utils').map

-- Comment and uncomment operator.
map('n', 'gc', '<Cmd>set operatorfunc=kutsan#mappings#operator#comment#<CR>g@', {
  silent = true,
})
map('x', 'gc', ':<C-u>call kutsan#mappings#operator#comment#(visualmode())<CR>', {
  silent = true,
})
