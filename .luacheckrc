cache = true
codes = true
std = 'luajit'

ignore = {
  "122", -- Setting a read-only field of a global variable.
}

read_globals = {
  'vim',
}
