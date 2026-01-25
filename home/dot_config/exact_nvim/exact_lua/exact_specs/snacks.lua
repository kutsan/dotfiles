local Plugin = { 'folke/snacks.nvim' }

Plugin.name = 'snacks'

Plugin.priority = 1000
Plugin.lazy = false

local function get_projects()
	local home = vim.fn.expand('~')

	local base_projects_path = home .. '/Documents/Projects'

	local potential_project_dirs =
		vim.fn.globpath(base_projects_path, '*/*', true, true)

	local projects = {}

	for _, path in ipairs(potential_project_dirs) do
		if vim.fn.isdirectory(path) == 1 then
			table.insert(projects, path)
		end
	end

	return projects
end

Plugin.opts = {
	zen = { enabled = true, toggles = { dim = false } },
	input = { enabled = true },
	toggle = { enabled = true },
	explorer = {
		enabled = true,
		replace_netrw = true,
	},
	picker = {
		icons = {
			tree = {
				vertical = '│ ',
				middle = '│ ',
				last = '│ ',
			},
		},
		layout = {
			preset = 'vertical',
		},
		enabled = true,
		sources = {
			files = {
				hidden = true,
				ignored = vim.fn.getcwd() == vim.uv.os_homedir(),
			},
			grep = {
				hidden = true,
				ignored = vim.fn.getcwd() == vim.uv.os_homedir(),
			},
			explorer = {
				focus = 'list',
				ignored = true,
				hidden = true,
				git_untracked = true,
				win = {
					list = {
						keys = {
							['/'] = false,
							['?'] = false,
						},
					},
				},
				layout = {
					layout = {
						zindex = 0,
						box = 'vertical',
						position = 'left',
						width = 40,
						{
							win = 'list',
							border = 'none',
							wo = {
								winhighlight = 'FloatBorder:CursorColumn,NormalFloat:CursorColumn',
							},
						},
					},
				},
			},
			projects = {
				dev = get_projects(),
				confirm = function(picker, item)
					picker:close()

					local snacks = require('snacks')

					if item and item.file then
						-- Check if the project is already open by checking the cwd of each tab
						local tabpages = vim.api.nvim_list_tabpages()
						for _, tabpage in ipairs(tabpages) do
							local tab_cwd = vim.fn.getcwd(-1, tabpage)
							if tab_cwd == item.file then
								-- Change to the tab
								vim.api.nvim_set_current_tabpage(tabpage)
								return
							end
						end

						-- If there are already opened buffers, open a new tab
						for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
							if
								vim.api.nvim_buf_is_loaded(bufnr)
								and vim.api.nvim_buf_get_name(bufnr) ~= ''
							then
								vim.cmd('tabnew')
								break
							end
						end

						-- Change cwd to the selected project, only for this tab
						vim.cmd('tcd ' .. vim.fn.fnameescape(item.file))
						snacks.picker.smart()
					end
				end,
			},
		},
	},
}

Plugin.keys = {
	{
		'<C-b>',
		function()
			local snacks = require('snacks')
			snacks.picker.buffers()
		end,
		desc = 'Buffers',
	},
	{
		'<C-p>',
		function()
			local snacks = require('snacks')

			if vim.fn.getcwd() == vim.uv.os_homedir() then
				snacks.picker.git_files()
			else
				snacks.picker.files({
					ignored = vim.fn.getcwd() == vim.uv.os_homedir(),
				})
			end
		end,
		desc = 'Find Files',
	},
	{
		'<Space><C-p>',
		function()
			local snacks = require('snacks')
			snacks.picker.git_files()
		end,
		desc = 'Find Files',
	},
	{
		'<Space>s"',
		function()
			local snacks = require('snacks')
			snacks.picker.registers()
		end,
		desc = 'Registers',
	},
	{
		'<Space>h',
		function()
			local snacks = require('snacks')
			snacks.picker.help()
		end,
		desc = 'Help Pages',
	},
	{
		'gs',
		function()
			local snacks = require('snacks')
			snacks.picker.grep()
		end,
		desc = 'Grep',
	},
	{
		'gs',
		function()
			local snacks = require('snacks')
			snacks.picker.grep_word()
		end,
		desc = 'Visual selection or word',
		mode = { 'x' },
	},
	{
		'<Space>f',
		function()
			local snacks = require('snacks')
			snacks.explorer.open()
		end,
		desc = 'File Explorer',
	},
	{
		'<Space>F',
		function()
			local snacks = require('snacks')
			snacks.explorer.reveal()
		end,
		desc = 'Reveal in Explorer',
	},
	{
		'<Space>u',
		function()
			local snacks = require('snacks')
			snacks.picker.undo()
		end,
		desc = 'Undo history',
	},
	{
		'<M-x>',
		function()
			local snacks = require('snacks')
			snacks.picker.commands()
		end,
		desc = 'Commands',
	},
	{
		'<Space>sH',
		function()
			local snacks = require('snacks')
			snacks.picker.highlights()
		end,
		desc = 'Highlights',
	},
	{
		'<Space>z',
		function()
			local snacks = require('snacks')
			snacks.zen()
		end,
		desc = 'Zen Mode',
	},
	{
		'<Space>:',
		function()
			local snacks = require('snacks')
			snacks.picker.command_history()
		end,
	},
	{
		'<Space>/',
		function()
			local snacks = require('snacks')
			snacks.picker.search_history()
		end,
	},
	{
		'<Space>`',
		function()
			local snacks = require('snacks')
			snacks.picker.marks()
		end,
	},
	{
		'<Space>gR',
		function()
			local snacks = require('snacks')
			snacks.picker.resume()
		end,
	},
}

Plugin.init = function()
	vim.api.nvim_create_autocmd('User', {
		pattern = 'VeryLazy',
		callback = function()
			local snacks = require('snacks')
			snacks.toggle.option('spell', { name = 'Spelling' }):map('<Space>us')
		end,
	})
end

return Plugin
