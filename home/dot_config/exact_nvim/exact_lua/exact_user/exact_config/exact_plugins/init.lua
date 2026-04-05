-- Disable unused built-in plugins.
vim.g.loaded_tar = true
vim.g.loaded_zip = true
vim.g.loaded_gzip = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_zipPlugin = true
vim.g.loaded_rrhelper = true
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_netrwFileHandlers = true
vim.g.loaded_netrwSettings = true
vim.g.loaded_2html_plugin = true
vim.g.loaded_vimballPlugin = true
vim.g.loaded_getscriptPlugin = true
vim.g.loaded_logipat = true
vim.g.loaded_tutor_mode_plugin = true
vim.g.loaded_matchit = true
vim.g.loaded_remote_plugins = true
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

local plugins = {
	-- Completion & Tooling
	{ 'blink_cmp', requires = { 'lazydev' } },
	{ 'lazydev' },
	{ 'schema_store' },
	{ 'conform' },
	{ 'ts_error_translator' },
	{ 'ts_comments' },

	-- Git
	{ 'gitsigns' },
	{ 'diffview' },

	-- Navigation & Buffers
	{ 'bufferline', requires = { 'devicons', 'grapple' } },
	{ 'grapple' },
	{ 'flash' },
	{ 'eyeliner' },
	{ 'windovigation' },
	{ 'scope' },

	-- Search & Replace
	{ 'grug_far' },

	-- Editing & Text Objects
	{ 'surround' },
	{ 'mini_pairs' },

	-- Visual
	{ 'devicons' },
	{ 'fidget' },
	{ 'highlight_colors' },
	{ 'color_converter' },
	{ 'mini_indentscope' },
	{ 'snacks' },

	-- Utilities
	{ 'chezmoi' },
	{ 'early_retirement' },
	{ 'qmk' },
}

local plugin_loader = require('user.api.plugins.loader')

-- Load plugins in order, respecting dependencies.
plugin_loader.load(plugins, function(plugin_file_name)
	local plugin_module =
		string.format('user.config.plugins.%s', plugin_file_name)

	require(plugin_module)
end)
