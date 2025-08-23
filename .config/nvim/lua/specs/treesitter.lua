local Plugin = { 'nvim-treesitter/nvim-treesitter' }

Plugin.name = 'treesitter'

Plugin.build = ':TSUpdate'

Plugin.dependencies = {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    name = 'treesitter-text-objects',
  },
  { 'nvim-treesitter/nvim-treesitter-context', name = 'treesitter-context' },
  { 'windwp/nvim-ts-autotag', name = 'treesitter-autotag' },
}

Plugin.opts = {
  ensure_installed = {
    'arduino',
    'astro',
    'awk',
    'bash',
    'c',
    'comment',
    'cpp',
    'css',
    'csv',
    'diff',
    'dockerfile',
    'editorconfig',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'gnuplot',
    'gpg',
    'graphql',
    'html',
    'http',
    'javascript',
    'jq',
    'jsdoc',
    'json',
    'json5',
    'jsonc',
    'ledger',
    'lua',
    'luadoc',
    'luap',
    'make',
    'markdown',
    'markdown_inline',
    'mermaid',
    'printf',
    'prisma',
    'query',
    'regex',
    'robots',
    'rust',
    'scss',
    'sql',
    'ssh_config',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'xml',
    'yaml',
  },
  sync_install = false,
  auto_install = true,
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { 'dockerfile' },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      include_surrounding_whitespace = function(object)
        local excluded_queries = {
          '@assignment.inner',
          '@assignment.outer',
          '@assignment.lhs',
          '@assignment.rhs',
          '@block.inner',
        }

        return not vim.tbl_contains(excluded_queries, object.query_string)
      end,
      keymaps = {
        ['is'] = '@assignment.inner',
        ['as'] = '@assignment.outer',
        ['i,'] = '@assignment.lhs',
        ['i.'] = '@assignment.rhs',

        ['a;'] = '@block.outer',
        ['i;'] = '@block.inner',

        ['ac'] = '@call.outer',
        ['ic'] = '@call.inner',

        ['aC'] = '@class.outer',
        ['iC'] = '@class.inner',

        ['az'] = '@comment.outer',
        ['iz'] = '@comment.inner',

        ['af'] = '@function.outer',
        ['if'] = '@function.inner',

        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',

        ['at'] = '@tag.outer',
        ['it'] = '@tag.inner',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['g>'] = '@parameter.inner',
      },
      swap_previous = {
        ['g<'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']x'] = '@parameter.outer',
        [']i'] = '@import.outer',
        [']f'] = '@function.outer',
        [']c'] = '@class.outer',
        [']s'] = '@assignment.outer',
        [']z'] = '@comment.outer',
      },
      goto_next_end = {
        [']X'] = '@parameter.outer',
        [']I'] = '@import.outer',
        [']F'] = '@function.outer',
        [']C'] = '@class.outer',
        [']S'] = '@assignment.outer',
        [']Z'] = '@comment.outer',
      },
      goto_previous_start = {
        ['[x'] = '@parameter.outer',
        ['[i'] = '@import.outer',
        ['[f'] = '@function.outer',
        ['[c'] = '@class.outer',
        ['[s'] = '@assignment.outer',
        ['[z'] = '@comment.outer',
      },
      goto_previous_end = {
        ['[X'] = '@parameter.outer',
        ['[I'] = '@import.outer',
        ['[F'] = '@function.outer',
        ['[C'] = '@class.outer',
        ['[S'] = '@assignment.outer',
        ['[Z'] = '@comment.outer',
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      floating_preview_opts = {},
      peek_definition_code = {
        ['gK'] = '@function.outer',
      },
    },
  },
}

Plugin.config = function(_, opts)
  local treesitter = require('nvim-treesitter.configs')
  local treesitter_context = require('treesitter-context')
  local treesitter_autotag = require('nvim-ts-autotag')

  treesitter.setup(opts)

  treesitter_autotag.setup()
  treesitter_context.setup({
    max_lines = 3,
  })
end

return Plugin
