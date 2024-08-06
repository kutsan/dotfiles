local api = vim.api
local opt_local = vim.opt_local
local cmd = vim.cmd

-- Start insert mode and disable line numbers in terminal buffer.
api.nvim_create_autocmd('TermOpen', {
  group = api.nvim_create_augroup('TerminalSettings', { clear = true }),
  callback = function()
    opt_local.number = false
    opt_local.relativenumber = false
    cmd.startinsert()
  end,
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
  end,
})

-- Block changes to read-only buffers.
api.nvim_create_autocmd('BufReadPost', {
  group = api.nvim_create_augroup('BlockReadOnly', { clear = true }),
  callback = function()
    local readonly = api.nvim_get_option_value('readonly', { scope = 'local' })
    api.nvim_set_option_value('modifiable', not readonly, { scope = 'local' })
  end,
})

-- Closes neovim automatically when nvim-tree is the last window in the view.
vim.api.nvim_create_autocmd('QuitPre', {
  group = api.nvim_create_augroup('AutoCloseNvimTree', { clear = true }),
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()

    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))

      if bufname:match('NvimTree_') ~= nil then
        table.insert(tree_wins, w)
      end

      if vim.api.nvim_win_get_config(w).relative ~= '' then
        table.insert(floating_wins, w)
      end
    end

    if 1 == #wins - #floating_wins - #tree_wins then
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

-- Save the current buffer after changes.
api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  group = api.nvim_create_augroup('AutoSaveBuffer', { clear = true }),
  callback = function()
    local buffer = require('user/buffer')
    buffer.save()
  end,
})

-- Jump to last known position and center buffer around cursor.
api.nvim_create_autocmd('BufWinEnter', {
  pattern = '?*',
  group = api.nvim_create_augroup('JumpLastPosition', { clear = true }),
  callback = function()
    local jump = require('user/jump')
    jump.jump_last_pos()
  end,
})

-- Remove trailing whitespace characters.
api.nvim_create_autocmd('BufWritePre', {
  group = api.nvim_create_augroup('TrimTrailingSpaces', { clear = true }),
  callback = function()
    local buffer = require('user/buffer')
    buffer.trim_trailing_spaces()
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    if vim.list_contains({ 'NvimTree' }, vim.bo.filetype) then
      vim.opt_local.winfixbuf = true
    end
  end,
})
