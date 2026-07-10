local opt_local = vim.opt_local

-- Fix 'commentstring'.
opt_local.commentstring = '; %s'

-- Remove space chars from 'list' option and opt out of the multispace sync
-- autocmd so it does not re-add them.
vim.b.disable_multispace_listchars = true
opt_local.listchars:remove('multispace')
opt_local.listchars:remove('leadmultispace')
