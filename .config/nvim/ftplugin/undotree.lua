local opt_local = vim.opt_local

-- Remove space chars from 'list' option.
opt_local.listchars:remove('multispace')
opt_local.listchars:remove('leadmultispace')
