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

		if #windows - #floating_windows - #snacks_windows == 1 then
			for _, picker in ipairs(require('snacks').picker.get()) do
				picker:close()
			end

			for _, w in ipairs(snacks_windows) do
				if vim.api.nvim_win_is_valid(w) then
					vim.api.nvim_win_close(w, true)
				end
			end
		end
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	desc = 'Disable automatic comment insertion on new lines.',
	group = vim.api.nvim_create_augroup('AutoNoAutoComment', { clear = true }),
	callback = function()
		vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
	end,
})
