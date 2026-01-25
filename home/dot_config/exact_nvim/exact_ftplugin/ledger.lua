local opt_local = vim.opt_local

-- Fix 'commentstring'.
opt_local.commentstring = '; %s'

-- Remove space chars from 'list' option.
opt_local.listchars:remove('multispace')
opt_local.listchars:remove('leadmultispace')
