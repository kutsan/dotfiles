local map = require('kutsan/utils').map
local fzf_lua = require('fzf-lua')

fzf_lua.setup({
  winopts = {
    height = 0.90,
    width = 0.65,
    row = 0.30,
    col = 0.50,
    hl = {
      border = 'FloatBorder',
    },
    preview = {
      vertical = 'down:60%',
      layout = 'vertical',
      scrollbar = 'float',
    },
  },
  keymap = {
    builtin = {
      ['<F10>'] = 'toggle-preview',
      ['<F11>'] = 'toggle-fullscreen',
      ['<S-Down>'] = 'preview-page-down',
      ['<S-Up>'] = 'preview-page-up',
    },
    fzf = {
      ['ctrl-a'] = 'toggle-all',
      ['ctrl-f'] = 'half-page-down',
      ['ctrl-b'] = 'half-page-up',
    },
  },
  files = {
    prompt = 'Files> ',
    git_icons = false,
    cmd = table.concat({
      'find .',
      '-type f',
      '-not -path "*node_modules*"',
      '-not -path "*/.git/*"',
      '-printf "%P\n"',
    }, ' '),
  },
  git = {
    files = {
      prompt = '> ',
      git_icons = false,
    },
    status = {
      prompt = 'GitStatus> ',
    },
    commits = {
      prompt = 'Commits> ',
    },
    bcommits = {
      prompt = 'BufferCommits> ',
    },
    branches = {
      prompt = 'Branches> ',
    },
  },
  grep = {
    prompt = 'Grep> ',
    input_prompt = 'Grep> ',
    git_icons = false,
    rg_opts = table.concat({
      '--vimgrep',
      '--hidden',
      '--no-ignore',
      '--column',
      '--line-number',
      '--no-heading',
      '--color=always',
      '--smart-case',
      "--glob '!{.git,node_modules}/*'",
    }, ' '),
  },
  args = {
    prompt = 'Args> ',
  },
  oldfiles = {
    prompt = 'OldFiles> ',
  },
  buffers = {
    prompt = 'Buffers> ',
  },
  blines = {
    prompt = 'BufferLines> ',
  },
  colorschemes = {
    prompt = 'Colorschemes> ',
  },
  lsp = {
    prompt = '> ',
  },
  helptags = { previewer = { _ctor = false } },
  manpages = { previewer = { _ctor = false } },
})

local map_opts = { silent = true }

map('n', '<Space><C-p>', '<Cmd>FzfLua files<CR>', map_opts)
map('n', '<M-x>', '<Cmd>FzfLua commands<CR>', map_opts)
map('n', '<C-b>', '<Cmd>FzfLua buffers<CR>', map_opts)
map('n', '<Space>h', '<Cmd>FzfLua help_tags<CR>', map_opts)
map('n', '<Space>:', '<Cmd>FzfLua command_history<CR>', map_opts)
map('n', '<Space>/', '<Cmd>FzfLua search_history<CR>', map_opts)
map('n', '<Space>`', '<Cmd>FzfLua marks<CR>', map_opts)
map('n', 'gs', '<Cmd>FzfLua live_grep_native<CR>', map_opts)
map('x', 'gs', '<Cmd>FzfLua grep_visual<CR>', map_opts)
map('n', '<C-p>', '<Cmd>FzfLua git_files<CR>', map_opts)
map('n', '<Space>gl', '<Cmd>FzfLua git_bcommits<CR>', map_opts)
map('n', '<Space>gL', '<Cmd>FzfLua git_commits<CR>', map_opts)
map('n', '<Space>gs', '<Cmd>FzfLua git_status<CR>', map_opts)
map('n', '<C-f>', '<Cmd>FzfLua lsp_document_symbols<CR>', map_opts)
