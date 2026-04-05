-- Enable Lua module loader.
vim.loader.enable()

-- Main entry points for the configuration.
---@type string[]
local user_modules = {
	'plugin_hooks',
	'colorschemes',
	'options',
	'treesitter',
	'plugins',
	'lsp',
	'autocmds',
	'keymaps',
}

-- Load user modules in order.
vim.iter(user_modules):each(function(module_name)
	local module_path = string.format('user.config.%s', module_name)
	require(module_path)
end)
