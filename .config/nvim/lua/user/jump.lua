local function jump_last_pos()
  if
    vim.bo.buftype == ''
    and vim.fn.index({ 'diff', 'gitcommit' }, vim.bo.filetype, 0, true) == -1
  then
    if vim.fn.line("'\"") >= 1 and vim.fn.line("'\"") <= vim.fn.line('$') then
      vim.cmd('normal! g`"zz')
    end
  end
end

return { jump_last_pos = jump_last_pos }
