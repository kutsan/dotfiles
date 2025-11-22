vim.api.nvim_create_autocmd('QuitPre', {
	desc = 'Close Neovim automatically when Snacks Explorer is the last window in the view.',
	group = vim.api.nvim_create_augroup(
		'AutoCloseSnacksExplorer',
		{ clear = true }
	),
	callback = function()
		local snacks_windows = {}
		local floating_windows = {}
		local windows = vim.api.nvim_list_wins()

		for _, w in ipairs(windows) do
			local filetype = vim.api.nvim_get_option_value(
				'filetype',
				{ buf = vim.api.nvim_win_get_buf(w) }
			)
			if filetype:match('snacks_') ~= nil then
				table.insert(snacks_windows, w)
			elseif vim.api.nvim_win_get_config(w).relative ~= '' then
				table.insert(floating_windows, w)
			end
		end

		if 1 == #windows - #floating_windows - #snacks_windows then
			-- Should quit, so we close all Snacks windows.
			for _, w in ipairs(snacks_windows) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})

vim.api.nvim_create_autocmd('VimResized', {
	desc = 'Resize splits when the terminal emulator window is resized.',
	group = vim.api.nvim_create_augroup('EqualizeSplits', { clear = true }),
	callback = function()
		local current_tab = vim.api.nvim_get_current_tabpage()

		vim.cmd('tabdo wincmd =')
		vim.api.nvim_set_current_tabpage(current_tab)
	end,
})

vim.api.nvim_create_autocmd('WinEnter', {
	desc = 'Show cursor line only in the active window (enable).',
	group = vim.api.nvim_create_augroup('AutoActiveCursorline', { clear = true }),
	callback = function()
		vim.opt_local.cursorline = true
	end,
})
vim.api.nvim_create_autocmd('WinLeave', {
	desc = 'Show cursor line only in the active window (disable).',
	group = 'AutoActiveCursorline',
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	desc = 'Disable automatic comment insertion on new lines.',
	group = vim.api.nvim_create_augroup('AutoNoAutoComment', { clear = true }),
	callback = function()
		vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
	end,
})
