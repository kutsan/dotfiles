local Plugin = { 'xavierchanth/arbor.nvim' }

Plugin.name = 'arbor'

local function arbor_post_switch(info)
	if info.new_path then
		require('arbor').actions.cd_new_path(info)
	else
		require('arbor').actions.cd_existing_worktree(info)
	end
end

---@type arbor.config
Plugin.opts = {
	settings = {
		add = {
			-- Naming resolution
			path_style = function(git_info)
				local target_branch_name = git_info.branch_info.display_name
				local project_folder_name = vim.fs.basename(git_info.toplevel)

				print(print(vim.inspect(git_info)))

				return ('%s--%s'):format(project_folder_name, target_branch_name)
			end,
		},
	},
	worktree = {
		normal = {
			path = '../..',
		},
	},
	hooks = {
		post_add = function(info)
			info = require('arbor').actions.set_upstream(info) or info
			arbor_post_switch(info)
		end,
		post_pick = arbor_post_switch,
	},
}

Plugin.keys = {
	{
		'<Space>gwa',
		function()
			require('arbor').add()
		end,
	},
	{
		'<Space>gwp',
		function()
			require('arbor').pick()
		end,
	},
}

return Plugin
