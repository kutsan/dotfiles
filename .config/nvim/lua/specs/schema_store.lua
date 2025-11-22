local Plugin = { 'b0o/SchemaStore.nvim' }

Plugin.name = 'schema-store'

Plugin.config = function()
	local schema_store = require('schemastore')

	vim.lsp.config('jsonls', {
		settings = {
			json = {
				validate = { enable = true },
				schemas = schema_store.json.schemas(),
			},
		},
	})

	vim.lsp.config('yamlls', {
		settings = {
			yaml = {
				schemaStore = {
					enable = false,
					url = '',
				},
				schemas = schema_store.yaml.schemas(),
			},
		},
	})
end

return Plugin
