vim.pack.add({
	{
		name = 'diffview',
		src = 'github:sindrets/diffview.nvim',
	},
})

local diffview = require('diffview')

local opts = {
	enhanced_diff_hl = true,
	file_panel = {
		win_config = {
			position = 'bottom',
			height = 10,
		},
		tree_options = {
			flatten_dirs = false,
			folder_statuses = 'only_folded',
		},
	},
	hooks = {
		diff_buf_win_enter = function()
			vim.opt_local.cursorline = false
		end,
	},
}

diffview.setup(opts)

vim.keymap.set('n', '<Space>gd', function()
	local diffview_lib = require('diffview.lib')
	local current_diffview_view = diffview_lib.get_current_view()

	if current_diffview_view then
		vim.cmd.DiffviewClose()
	else
		vim.cmd.DiffviewOpen()
	end
end, { silent = true, desc = 'Toggle diffview' })

vim.keymap.set(
	'n',
	'<Space>gl',
	'<Cmd>DiffviewFileHistory %<CR>',
	{ silent = true, desc = 'File history (current file)' }
)

vim.keymap.set(
	'n',
	'<Space>gL',
	'<Cmd>DiffviewFileHistory<CR>',
	{ silent = true, desc = 'File history (all files)' }
)
