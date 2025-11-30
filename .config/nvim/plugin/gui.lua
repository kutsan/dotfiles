local opt = vim.opt
local keymap = vim.keymap

-- GUI Options
opt.guifont = 'MonoLisa Variable,Symbols Nerd Font Mono:h17.5:#h-none'
opt.linespace = 11

-- Neovide Options
if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_fullscreen = true
	vim.g.neovide_floating_corner_radius = 0.1
end

-- Neovide Keymaps
if vim.g.neovide then
	keymap.set('v', '<D-c>', '"*y')
	keymap.set('n', '<D-v>', '"*P')
	keymap.set('v', '<D-v>', '"*P')
	keymap.set('c', '<D-v>', '<C-r>*')
	keymap.set('i', '<D-v>', '<C-r>*')

	local initial_scale = 1.0
	vim.g.neovide_scale_factor = initial_scale

	local scale_step = 0.1

	local function set_scale(new_scale_factor)
		vim.g.neovide_scale_factor = math.max(0.5, math.min(new_scale_factor, 3.0))
	end

	vim.keymap.set('n', '<D-=>', function()
		set_scale(vim.g.neovide_scale_factor + scale_step)
	end)

	vim.keymap.set('n', '<D-->', function()
		set_scale(vim.g.neovide_scale_factor - scale_step)
	end)

	vim.keymap.set('n', '<D-0>', function()
		set_scale(initial_scale)
	end)
end
