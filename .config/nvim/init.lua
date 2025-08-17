vim.loader.enable()

-- Disable unused built-in plugins.
vim.g.loaded_tar = true
vim.g.loaded_zip = true
vim.g.loaded_gzip = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_zipPlugin = true
vim.g.loaded_rrhelper = true
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_netrwFileHandlers = true
vim.g.loaded_netrwSettings = true
vim.g.loaded_2html_plugin = true
vim.g.loaded_vimballPlugin = true
vim.g.loaded_getscriptPlugin = true
vim.g.loaded_logipat = true
vim.g.loaded_tutor_mode_plugin = true
vim.g.loaded_matchit = true
vim.g.loaded_remote_plugins = true
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Load lazy.nvim.
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require('lazy')

lazy.setup('specs', {
  change_detection = {
    enabled = false,
  },
  rocks = {
    hererocks = {
      enabled = true,
    },
  },
})
