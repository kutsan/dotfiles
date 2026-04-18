---@type table<string, boolean>
local git_root_cache = {}

---@param dir string
---@return boolean
local function is_git_root(dir)
	if git_root_cache[dir] == nil then
		git_root_cache[dir] = (vim.uv or vim.loop).fs_stat(dir .. '/.git') ~= nil
	end
	return git_root_cache[dir]
end

---@param path? number|string buffer or path
---@return string?
local function get_git_root(path)
	local resolved = path or 0
	resolved = type(resolved) == 'number' and vim.api.nvim_buf_get_name(resolved)
		or resolved --[[@as string]]
	resolved = resolved == '' and (vim.uv or vim.loop).cwd() or resolved

	local normalized = vim.fs.normalize(resolved)

	if is_git_root(normalized) then
		return normalized
	end

	for dir in vim.fs.parents(normalized) do
		if is_git_root(dir) then
			return vim.fs.normalize(dir)
		end
	end

	return os.getenv('GIT_WORK_TREE')
end

local function set_shada_file()
	---@type string?
	local git_root = get_git_root()

	---@type string?
	local directory = git_root ~= nil and git_root or vim.uv.cwd()

	---@type string
	local shada_file = vim.fs.joinpath(
		vim.fn.stdpath('state'),
		'shada',
		vim.fs.basename(directory) .. '.shada'
	)

	vim.o.shadafile = shada_file
end

return { set_shada_file = set_shada_file }
