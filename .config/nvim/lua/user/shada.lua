local function set_shada_file()
	local git_root = require('snacks').git.get_root()
	local dir = git_root ~= nil and git_root or vim.fn.getcwd()

	local shada_file = vim.fs.joinpath(
		vim.fn.stdpath('state'),
		'shada',
		vim.fn.fnamemodify(dir, ':t') .. '.shada'
	)
	vim.o.shadafile = shada_file
end

return { set_shada_file = set_shada_file }
