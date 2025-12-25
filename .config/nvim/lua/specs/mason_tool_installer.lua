local Plugin = { 'WhoIsSethDaniel/mason-tool-installer.nvim' }

Plugin.name = 'mason-tool-installer'

Plugin.dependencies = { 'mason-lspconfig' }

Plugin.opts = {
	ensure_installed = {
		-- LSP Servers
		'tsgo',
		'eslint',
		'html',
		'cssls',
		'cssmodules_ls',
		'stylelint_lsp',
		'jsonls',
		'yamlls',
		'lua_ls',
		'vimls',
		'typos_lsp',
		'taplo',
		'docker_language_server',
		'docker_compose_language_service',
		'gh_actions_ls',
		'copilot',
		'bashls',

		-- Formatters
		'prettierd',
		'stylua',
	},
}

Plugin.config = function(_, opts)
	local mason_tool_installer = require('mason-tool-installer')

	mason_tool_installer.setup(opts)

	-- Update tools after Lazy has installed plugins.
	vim.api.nvim_create_autocmd('User', {
		pattern = 'LazyInstall',
		callback = function()
			vim.cmd.MasonToolsUpdate()
		end,
	})
end

return Plugin
