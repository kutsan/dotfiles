local cmd = vim.cmd

-- Grep text in git repository or current working directory.
cmd('command -nargs=* -bang Grep call kutsan#commands#grep#(<bang>v:false, <q-args>)')
