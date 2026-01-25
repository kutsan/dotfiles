local keymap = vim.keymap

-- Save file.
keymap.set('n', '\\w', function()
	vim.cmd.write({
		mods = { silent = true },
	})
end, { silent = true })

-- Set <C-i> to itself to support separate mappings for <Tab> and <C-i>.
keymap.set('n', '<C-i>', '<C-i>')

-- Quickly close current window.
keymap.set('n', '<Space>q', '<C-w>q')

-- Pane navigation.
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-l>', '<C-w>l')

-- Toggle folds.
keymap.set('n', '<Tab>', 'za')

-- Always send contents of a `x` command to the black hole register.
keymap.set('n', 'x', '"_x')

-- Go to the alternate buffer.
keymap.set('n', '<C-n>', '<C-^>')

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
	local buffer = require('user/buffer')
	buffer.remove({ force = false })
end, { silent = true })
keymap.set('n', '\\Q', function()
	local buffer = require('user/buffer')
	buffer.remove({ force = true })
end, { silent = true })

-- Open URL under cursor in browser or open path in GUI explorer.
keymap.set('n', 'gb', function()
	local url = vim.fn.expand('<cfile>')
	local escaped_url = vim.fn.escape(url, '#%!')

	vim.cmd(('silent !open "%s"'):format(escaped_url))
end, { silent = true })

-- Toggle common options.
keymap.set('n', 'cos', '<Cmd>set spell!<CR>', { silent = true })
keymap.set('n', 'cow', '<Cmd>set wrap!<CR>', { silent = true })
keymap.set('n', 'coh', '<Cmd>nohlsearch<CR>', { silent = true })
keymap.set('n', 'coH', '<Cmd>set hlsearch!<CR>', { silent = true })

-- Select last changed or yanked area.
keymap.set(
	'n',
	'gV',
	"'`[' .. strpart(getregtype(), 0, 1) .. '`]'",
	{ expr = true }
)
