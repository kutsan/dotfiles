local opt = vim.opt

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
