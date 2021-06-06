local formatter = require('formatter')
local map = require('kutsan.utils').map
local api = vim.api

local function prettier()
  return {
    exe = 'node_modules/.bin/prettier',
    args = {
      '--stdin-filepath',
      api.nvim_buf_get_name(0),
    },
    stdin = true,
  }
end

local function stylua()
  return {
    exe = 'stylua',
    args = {
      '-',
    },
    stdin = true,
  }
end

formatter.setup({
  logging = true,
  filetype = {
    javascript = { prettier },
    javascriptreact = { prettier },
    typescript = { prettier },
    typescriptreact = { prettier },
    css = { prettier },
    json = { prettier },
    graphql = { prettier },
    markdown = { prettier },
    yaml = { prettier },
    html = { prettier },
    lua = { stylua },
  },
})

map('n', '\\f', '<Cmd>FormatWrite<CR>', { noremap = true, silent = true })
