local keymap = vim.keymap

local is_mac = vim.fn.has('mac') == 1

-- Disable built-in snippet navigation keymaps.
keymap.set({ 'i', 's' }, '<Tab>', function()
	return '<Tab>'
end, { expr = true, silent = true })
keymap.set({ 'i', 's' }, '<S-Tab>', function()
	return '<S-Tab>'
end, { expr = true, silent = true })

-- Save file.
keymap.set('n', '\\w', function()
	vim.cmd.write({
		mods = { silent = true },
	})
end, { silent = true })

-- Set <C-i> to itself to support separate mappings for <Tab> and <C-i>.
keymap.set('n', '<C-i>', '<C-i>')

-- Jump back and forward.
keymap.set('n', is_mac and '<D-[>' or '<A-Left>', '<C-o>')
keymap.set('n', is_mac and '<D-]>' or '<A-Right>', '<C-i>')

-- Pane navigation.
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-l>', '<C-w>l')

-- Close the current tab page.
keymap.set('n', '<C-w>C', function()
	vim.cmd.tabclose()
end, { silent = true })

-- Close every tab page but the current one.
keymap.set('n', '<C-w>O', function()
	vim.cmd.tabonly()
end, { silent = true })

-- Toggle folds.
keymap.set('n', '<Tab>', 'za')

-- Always send contents of a `x` command to the black hole register.
keymap.set('n', 'x', '"_x')

-- Refactor word under cursor.
keymap.set('n', 'c*', function()
	local word_under_cursor = vim.fn.expand('<cword>')
	local escaped_word = vim.fn.escape(word_under_cursor, '/\\')

	local pattern = '\\<' .. escaped_word .. '\\>\\C'
	vim.fn.setreg('/', pattern)

	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes('cgn', true, false, true),
		'n',
		false
	)
end)
keymap.set('n', 'c#', function()
	local word_under_cursor = vim.fn.expand('<cword>')
	local escaped_word = vim.fn.escape(word_under_cursor, '/\\')

	local pattern = '\\<' .. escaped_word .. '\\>\\C'
	vim.fn.setreg('/', pattern)

	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes('cgN', true, false, true),
		'n',
		false
	)
end)

-- Snippet navigation.
vim.keymap.set({ 'i', 's' }, '<C-j>', function()
	if vim.snippet.active({ direction = 1 }) then
		vim.snippet.jump(1)
	end
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
	if vim.snippet.active({ direction = -1 }) then
		vim.snippet.jump(-1)
	end
end, { silent = true })

-- Remap `j` and `k` for dealing with word wrap.
keymap.set(
	{ 'n', 'x' },
	'k',
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true }
)
keymap.set(
	{ 'n', 'x' },
	'j',
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true }
)

-- Copy to system clipboard.
keymap.set({ 'n', 'x' }, '<D-c>', '"*y')

-- Scroll viewport faster.
keymap.set('n', '<C-e>', '3<C-e>')
keymap.set('n', '<C-y>', '3<C-y>')

-- Resize current window sizes.
keymap.set('n', '<S-Up>', '2<C-w>+')
keymap.set('n', '<S-Down>', '2<C-w>-')
keymap.set('n', '<S-Right>', '2<C-w>>')
keymap.set('n', '<S-Left>', '2<C-w><')

-- Disable `J` to prevent accidental line joining.
keymap.set('n', 'J', '<Nop>')

-- Remove current buffer without losing window layout.
keymap.set('n', '\\q', function()
	local buffer = require('user.api.keymaps.buffer')
	buffer.remove({ force = false })
end, { silent = true })
keymap.set('n', '\\Q', function()
	local buffer = require('user.api.keymaps.buffer')
	buffer.remove({ force = true })
end, { silent = true })

-- Open URL under cursor in browser or open path in GUI explorer.
keymap.set('n', 'gb', function()
	local url = vim.fn.expand('<cfile>')

	vim.ui.open(url)
end, { silent = true })

-- Toggle common options.
keymap.set('n', 'cos', function()
	vim.o.spell = not vim.o.spell
end, { desc = 'Toggle spell' })
keymap.set('n', 'cow', function()
	vim.o.wrap = not vim.o.wrap
end, { desc = 'Toggle wrap' })
keymap.set('n', 'coh', function()
	vim.cmd.nohlsearch()
end, { desc = 'Clear search highlight' })
keymap.set('n', 'coH', function()
	vim.o.hlsearch = not vim.o.hlsearch
end, { desc = 'Toggle hlsearch' })
keymap.set('n', 'coD', function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle diagnostics' })

-- Select last changed or yanked area.
keymap.set(
	'n',
	'gV',
	"'`[' .. strpart(getregtype(), 0, 1) .. '`]'",
	{ expr = true }
)

-- Open undo history.
vim.keymap.set('n', '<Space>u', function()
	vim.cmd.packadd('nvim.undotree')

	local undotree = require('undotree')
	undotree.open()
end, { desc = 'Undo history' })
