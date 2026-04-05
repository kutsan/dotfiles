vim.api.nvim_create_autocmd('TermOpen', {
	desc = 'Start insert mode and disable line numbers in terminal buffer.',
	group = vim.api.nvim_create_augroup('TerminalSettings', { clear = true }),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.cmd.startinsert()
	end,
})
