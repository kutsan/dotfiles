vim.pack.add({
	{
		name = 'snacks',
		src = 'github:folke/snacks.nvim',
	},
})

local snacks = require('snacks')

--- Each part lives in `snacks_<name>.lua` next to this file.
local config_parts = {
	'picker',
	'explorer',
	'zen',
	'toggle',
	'indent',
	'statuscolumn',
	'image',
	'bigfile',
	'input',
}

local modules = vim
	.iter(config_parts)
	:map(function(config_part)
		return require(string.format('user.config.plugins.snacks_%s', config_part))
	end)
	:totable()

local opts = vim.iter(modules):fold({}, function(acc, module)
	return vim.tbl_deep_extend('force', acc, module.opts)
end)

snacks.setup(opts)

vim.iter(modules):each(function(module)
	if module.after_setup then
		module.after_setup(snacks)
	end
end)
