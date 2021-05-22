local g = vim.g

-- Disable showing counts next to signs.
g.signify_sign_show_count = false

-- Set priority of signs.
g.signify_priority = 5

-- Define symbols for signs.
g.signify_sign_add = '│' -- U+2502
g.signify_sign_delete = '│' -- U+2502
g.signify_sign_delete_first_line = '│' -- U+2502
g.signify_sign_change = '│' -- U+2502
g.signify_sign_changedelete = '│' -- U+2502
