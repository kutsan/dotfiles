local api = vim.api
local opt_local = vim.opt_local
local cmd = vim.cmd

-- Start insert mode and disable line numbers in terminal buffer.
api.nvim_create_autocmd('TermOpen', {
  group = api.nvim_create_augroup('TerminalSettings', { clear = true }),
  callback = function()
    opt_local.number = false
    opt_local.relativenumber = false
    cmd('startinsert')
  end
})

-- Briefly highlight yanked region.
api.nvim_create_autocmd('TextYankPost', {
  group = api.nvim_create_augroup('HighlightYank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = 'Visual',
      timeout = 100,
      on_visual = false,
    })
  end
})

-- Block changes to read-only buffers.
api.nvim_create_autocmd('BufReadPost', {
  group = api.nvim_create_augroup('BlockReadOnly', { clear = true }),
  callback = function()
    local readonly = api.nvim_buf_get_option(0, 'readonly')
    api.nvim_buf_set_option(0, 'modifiable', not readonly)
  end
})

-- -- Save the current buffer after changes.
-- api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged', }, {
--   callback = function()
--     local buffer = require('kutsan/autocmds/buffer')
--     buffer.save()
--   end
-- })

-- -- Jump to last known position and center buffer around cursor.
-- api.nvim_create_autocmd('BufWinEnter', {
--   pattern = '?*',
--   callback = function()
--     local buffer = require('kutsan/autocmds/buffer')
--     buffer.jump_last_position()
--   end
-- })

-- -- Remove trailing whitespace characters.
-- api.nvim_create_autocmd('BufWritePre', {
--   callback = function()
--     local buffer = require('kutsan/autocmds/buffer')
--     buffer.trim_trailing_spaces()
--   end
-- })
