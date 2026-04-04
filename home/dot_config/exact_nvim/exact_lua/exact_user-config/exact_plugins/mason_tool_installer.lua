vim.pack.add({
	{
		name = 'mason-tool-installer',
		src = 'github:WhoIsSethDaniel/mason-tool-installer.nvim',
	},
})

local mason_tool_installer = require('mason-tool-installer')

local opts = {
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
		'bashls',
		'tinymist',
		'typstyle',
		'markdown-oxide',

		-- Formatters
		'prettierd',
		'stylua',

		-- Debug Adapters
		'js-debug-adapter',
	},
}

mason_tool_installer.setup(opts)

-- Update tools after `vim.pack` has installed plugins.
vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(event)
		if event.data.kind ~= 'install' then
			return
		end

		vim.cmd.MasonToolsUpdate()

		-- Remove this autocmd after first trigger.
		return true
	end,
})

-- Patch `js-debug-adapter` to work with ECMAScript modules.
vim.api.nvim_create_autocmd('User', {
	pattern = 'MasonToolsUpdateCompleted',
	callback = function(event)
		local installed_tools = event.data

		if not vim.list_contains(installed_tools, 'js-debug-adapter') then
			return
		end

		vim.schedule(function()
			local dir_path = vim.fn.stdpath('data')
				.. '/mason/packages/js-debug-adapter/js-debug/src'
			local file_path = dir_path .. '/package.json'

			if vim.fn.isdirectory(dir_path) == 1 then
				local file = io.open(file_path, 'w')

				if file then
					file:write('{ "type": "commonjs" }')
					file:close()
				end
			end
		end)
	end,
})
