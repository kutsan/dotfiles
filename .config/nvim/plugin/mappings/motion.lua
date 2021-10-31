local map = require('kutsan/utils').map

-- [a]n [e]ntire buffer motions.
map(
  'o',
  'ae',
  "<Cmd>lua require('kutsan/mappings/motion/entire').select_entire_buffer()<CR>",
  { silent = true }
)
map(
  'x',
  'ae',
  "<Cmd>lua require('kutsan/mappings/motion/entire').select_entire_buffer()<CR>",
  { silent = true }
)

-- [i]nner line motion.
map('o', 'i_', '<Cmd>normal! ^vg_<CR>', { silent = true })
map('x', 'i_', '<Cmd>normal! ^og_<CR>', { silent = true })

-- [i]n and [a]round [i]ndent motions.
map('o', 'ii', ":<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'i' })<CR>", {
  silent = true,
})
map('x', 'ii', ":<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'i' })<CR>", {
  silent = true,
})
map('o', 'ai', ":<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'a' })<CR>", {
  silent = true,
})
map('x', 'ai', ":<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'a' })<CR>", {
  silent = true,
})
map('o', 'io', ":<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'o' })<CR>", {
  silent = true,
})
map('x', 'io', ":<C-u>call kutsan#mappings#motion#indent#({ 'mode': 'o' })<CR>", {
  silent = true,
})
