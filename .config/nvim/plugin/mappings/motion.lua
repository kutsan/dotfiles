local keymap = vim.keymap

-- [a]n [e]ntire buffer motions.
keymap.set({ 'o', 'x' }, 'ae', function()
  local entire = require('user/entire')
  entire.select_entire_buffer()
end, { silent = true })

-- [i]nner line motion.
keymap.set('o', 'i_', '<Cmd>normal! ^vg_<CR>', { silent = true })
keymap.set('x', 'i_', '<Cmd>normal! ^og_<CR>', { silent = true })

-- [i]n and [a]round [i]ndent motions.
keymap.set('o', 'ii', ":<C-u>call user#indent#({ 'mode': 'i' })<CR>", {
  silent = true,
})
keymap.set('x', 'ii', ":<C-u>call user#indent#({ 'mode': 'i' })<CR>", {
  silent = true,
})
keymap.set('o', 'ai', ":<C-u>call user#indent#({ 'mode': 'a' })<CR>", {
  silent = true,
})
keymap.set('x', 'ai', ":<C-u>call user#indent#({ 'mode': 'a' })<CR>", {
  silent = true,
})
keymap.set('o', 'io', ":<C-u>call user#indent#({ 'mode': 'o' })<CR>", {
  silent = true,
})
keymap.set('x', 'io', ":<C-u>call user#indent#({ 'mode': 'o' })<CR>", {
  silent = true,
})
