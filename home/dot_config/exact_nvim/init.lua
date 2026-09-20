-- Enable the experimental Lua module loader.
vim.loader.enable()

-- Enable the new experimental UI for Neovim.
require('vim._core.ui2').enable({
	msg = {
		target = 'msg',
		targets = {
			echoerr = 'pager',
			lua_error = 'pager',
			rpc_error = 'pager',
			shell_err = 'pager',
			shell_out = 'pager',
			list_cmd = 'pager',
			verbose = 'pager',

			empty = 'cmd',
			completion = 'cmd',
			search_count = 'cmd',
			wildlist = 'cmd',
			typed_cmd = 'cmd',
		},
		cmd = {
			height = 0.5,
		},
		msg = {
			height = 0.3,
			timeout = 5000,
		},
		pager = {
			height = 0.5,
		},
	},
})

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
