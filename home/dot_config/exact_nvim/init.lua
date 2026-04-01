vim.loader.enable()

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

local specs = {
	-- Colorscheme
	{ 'catppuccin' },

	-- Completion & Snippets
	{ 'blink_cmp', requires = { 'lazydev' } },

	-- LSP & Tooling
	{ 'lsp_config' },
	{ 'mason', requires = { 'lsp_config' } },
	{ 'mason_lsp_config', requires = { 'lsp_config', 'mason' } },
	{
		'mason_tool_installer',
		requires = { 'lsp_config', 'mason', 'mason_lsp_config' },
	},
	{ 'lazydev' },
	{ 'schema_store' },
	{ 'conform' },
	{ 'ts_error_translator' },

	-- AI
	{ 'copilot' },

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

	-- Comments
	{ 'todo_comments' },
	{ 'ts_comments' },

	-- Utilities
	{ 'chezmoi' },
	{ 'early_retirement' },
	{ 'qmk' },
}

require('user.specs').load_specs(specs)
