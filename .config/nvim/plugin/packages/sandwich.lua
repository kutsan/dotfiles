local cmd = vim.cmd
local g = vim.g

-- Disable text object support.
g.textobj_sandwich_no_default_key_mappings = true

-- Remove highlight delay.
cmd("call operator#sandwich#set('all', 'all', 'highlight', 0)")
