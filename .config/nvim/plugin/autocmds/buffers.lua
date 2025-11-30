vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Briefly highlight yanked region.',
	group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			higroup = 'Visual',
			timeout = 100,
			on_visual = false,
		})
	end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
	desc = 'Block changes to read-only buffers.',
	group = vim.api.nvim_create_augroup('BlockReadOnly', { clear = true }),
	callback = function()
		local readonly =
			vim.api.nvim_get_option_value('readonly', { scope = 'local' })
		vim.api.nvim_set_option_value(
			'modifiable',
			not readonly,
			{ scope = 'local' }
		)
	end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
	desc = 'Restore cursor to file position in previous editing session.',
	pattern = '?*',
	group = vim.api.nvim_create_augroup('JumpLastPosition', { clear = true }),
	callback = function(args)
		-- Skip if the buffer is not a normal file or a git commit.
		if
			vim.bo.buftype == ''
			or vim.tbl_contains({ 'diff', 'gitcommit' }, vim.bo.filetype)
		then
			return
		end

		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)

		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"zz')
		end
	end,
})

vim.api.nvim_create_autocmd('BufEnter', {
	desc = 'Set winfixbuf for quickfix buffers.',
	group = vim.api.nvim_create_augroup('QuickfixWinFixBuf', { clear = true }),
	callback = function()
		if vim.list_contains({ 'qf' }, vim.bo.filetype) then
			vim.opt_local.winfixbuf = true
		end
	end,
})
