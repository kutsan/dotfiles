local function load_specs(specs)
	local specs_by_name = vim.iter(specs):fold({}, function(acc, spec)
		acc[spec[1]] = spec
		return acc
	end)

	local loaded = {}
	local visiting = {}

	local function load(name)
		if loaded[name] then
			return
		end

		if visiting[name] then
			error('Circular dependency: ' .. name)
		end

		visiting[name] = true

		vim
			.iter(specs_by_name[name] and specs_by_name[name].requires or {})
			:each(load)

		visiting[name] = nil
		loaded[name] = true

		require(string.format('specs.%s', name))
	end

	vim.iter(specs):each(function(s)
		load(s[1])
	end)
end

return {
	load_specs = load_specs,
}
