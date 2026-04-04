--- Load plugins in topological order, respecting dependencies.
--- @param plugins { [1]: string, requires?: string[] }[]
--- @param loader fun(name: string)
local function load(plugins, loader)
	--- @type table<string, { [1]: string, requires?: string[] }>
	local plugins_by_name = vim.iter(plugins):fold({}, function(acc, plugin)
		acc[plugin[1]] = plugin
		return acc
	end)

	--- @type table<string, boolean>
	local loaded = {}
	--- @type table<string, boolean>
	local visiting = {}

	--- @param name string
	local function load_plugin(name)
		if loaded[name] then
			return
		end

		if visiting[name] then
			error('Circular dependency: ' .. name)
		end

		visiting[name] = true

		vim
			.iter(plugins_by_name[name] and plugins_by_name[name].requires or {})
			:each(load_plugin)

		visiting[name] = nil
		loaded[name] = true

		loader(name)
	end

	vim.iter(plugins):each(function(plugin)
		load_plugin(plugin[1])
	end)
end

return {
	load = load,
}
