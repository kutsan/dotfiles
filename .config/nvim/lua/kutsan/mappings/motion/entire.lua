local cmd = vim.api.nvim_command

--
-- Select an entire buffer.
--
-- onoremap <silent> ae <Cmd>lua require('kutsan/mappings/motion/entire').select_entire_buffer()<CR>
-- xnoremap <silent> ae <Cmd>lua require('kutsan/mappings/motion/entire').select_entire_buffer()<CR>
--
local function select_entire_buffer()
  cmd("normal! m'")
  cmd('keepjumps normal! gg0VoG')
end

return { select_entire_buffer = select_entire_buffer }
