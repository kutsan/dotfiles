local Plugin = { 'alker0/chezmoi.vim' }

Plugin.name = 'chezmoi'

Plugin.lazy = false

Plugin.init = function()
	vim.g['chezmoi#use_tmp_buffer'] = true
end

return Plugin
