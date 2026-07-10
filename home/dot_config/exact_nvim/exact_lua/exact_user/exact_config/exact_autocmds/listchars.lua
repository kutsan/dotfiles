local function sync_multispace_listchars()
	if vim.b.disable_multispace_listchars then
		return
	end

	local shiftwidth = vim.bo.shiftwidth

	if shiftwidth < 2 then
		return
	end

	local lead = '▏' .. string.rep(' ', shiftwidth - 1)

	vim.opt_local.listchars:append({
		multispace = lead,
		leadmultispace = lead,
	})
end

vim.api.nvim_create_autocmd('OptionSet', {
	desc = 'Sync listchars multispace/leadmultispace with shiftwidth (e.g. from .editorconfig).',
	pattern = 'shiftwidth',
	group = vim.api.nvim_create_augroup(
		'SyncMultiSpaceListchars',
		{ clear = true }
	),
	callback = function()
		vim.schedule(sync_multispace_listchars)
	end,
})

vim.api.nvim_create_autocmd({ 'BufWinEnter', 'FileType' }, {
	desc = 'Apply multispace/leadmultispace on buffer/window entry as a fallback for OptionSet.',
	group = vim.api.nvim_create_augroup(
		'SyncMultiSpaceListcharsFallback',
		{ clear = true }
	),
	callback = function()
		vim.schedule(sync_multispace_listchars)
	end,
})
