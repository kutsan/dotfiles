local keymap = vim.keymap

-- [a]n [e]ntire buffer motions.
keymap.set({ 'o', 'x' }, 'ae', function()
	local select_entire_buffer =
		require('user-api.keymaps.select_entire_buffer').select_entire_buffer

	select_entire_buffer()
end, { silent = true })

-- [i]nner line motion.
keymap.set('o', 'i_', '<Cmd>normal! ^vg_<CR>', { silent = true })
keymap.set('x', 'i_', '<Cmd>normal! ^og_<CR>', { silent = true })
