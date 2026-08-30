local opt = vim.opt

if vim.env.SUDO_USER ~= nil then
	opt.swapfile = false
	opt.backup = false
	opt.writebackup = false
	opt.undofile = false
	opt.shada = ''
end
