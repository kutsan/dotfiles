vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Start insert mode and disable line numbers in terminal buffer.',
  group = vim.api.nvim_create_augroup('TerminalSettings', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd.startinsert()
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Briefly highlight yanked region.',
  group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = 'Visual',
      timeout = 100,
      on_visual = false,
    })
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Block changes to read-only buffers.',
  group = vim.api.nvim_create_augroup('BlockReadOnly', { clear = true }),
  callback = function()
    local readonly =
      vim.api.nvim_get_option_value('readonly', { scope = 'local' })
    vim.api.nvim_set_option_value(
      'modifiable',
      not readonly,
      { scope = 'local' }
    )
  end,
})

vim.api.nvim_create_autocmd('QuitPre', {
  desc = 'Closes neovim automatically when nvim-tree is the last window in the view.',
  group = vim.api.nvim_create_augroup('AutoCloseNvimTree', { clear = true }),
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

vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  desc = 'Save the current buffer after changes.',
  group = vim.api.nvim_create_augroup('AutoSaveBuffer', { clear = true }),
  callback = function()
    local buffer = require('user/buffer')
    buffer.save()
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Restore cursor to file position in previous editing session.',
  pattern = '?*',
  group = vim.api.nvim_create_augroup('JumpLastPosition', { clear = true }),
  callback = function(args)
    -- Skip if the buffer is not a normal file or a git commit.
    if
      vim.bo.buftype == ''
      or vim.tbl_contains({ 'diff', 'gitcommit' }, vim.bo.filetype)
    then
      return
    end

    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)

    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`"zz')
    end
  end,
})

vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Resize splits when the terminal window is resized.',
  group = vim.api.nvim_create_augroup('EqualizeSplits', { clear = true }),
  callback = function()
    local current_tab = vim.api.nvim_get_current_tabpage()

    vim.cmd('tabdo wincmd =')
    vim.api.nvim_set_current_tabpage(current_tab)
  end,
})

vim.api.nvim_create_autocmd('WinEnter', {
  desc = 'Show cursor line only in active window.',
  group = vim.api.nvim_create_augroup(
    'AutoCursorlineShowCursorline',
    { clear = true }
  ),
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = nil
    end
  end,
})
vim.api.nvim_create_autocmd('WinLeave', {
  desc = 'Show cursor line only in active window.',
  group = vim.api.nvim_create_augroup(
    'AutoCursorlineHideCursorline',
    { clear = true }
  ),
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_cursorline = true
      vim.wo.cursorline = false
    end
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Set winfixbuf for quickfix buffers.',
  group = vim.api.nvim_create_augroup('QuickfixWinFixBuf', { clear = true }),
  callback = function()
    if vim.list_contains({ 'qf' }, vim.bo.filetype) then
      vim.opt_local.winfixbuf = true
    end
  end,
})
