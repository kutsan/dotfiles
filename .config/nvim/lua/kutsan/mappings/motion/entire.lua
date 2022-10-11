local cmd = vim.cmd

--
-- Select an entire buffer.
--
-- onoremap <silent> ae <Cmd>lua require('kutsan/mappings/motion/entire').select_entire_buffer()<CR>
-- xnoremap <silent> ae <Cmd>lua require('kutsan/mappings/motion/entire').select_entire_buffer()<CR>
--
local function select_entire_buffer()
  cmd.normal({ "m'", bang = true })
  cmd('keepjumps normal! gg0VoG')
end

return { select_entire_buffer = select_entire_buffer }
