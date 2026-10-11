local opts = {
	zen = {
		win = {
			width = 100,
			backdrop = {
				transparent = false,
				blend = 99,
			},
		},
		toggles = {
			dim = false,
		},
	},
}

local function after_setup(snacks)
	vim.keymap.set('n', '<Space>z', snacks.zen.zen, { desc = 'Toggle zen mode' })
end

return { opts = opts, after_setup = after_setup }
