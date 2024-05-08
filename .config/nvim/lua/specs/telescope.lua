local Plugin = { 'nvim-telescope/telescope.nvim' }

Plugin.name = 'telescope'
Plugin.version = '*'

Plugin.dependencies = {
  { 'nvim-lua/plenary.nvim', name = 'plenary' },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    name = 'telescope-fzf-native',
    build = 'make',
  },
  { 'ThePrimeagen/git-worktree.nvim', name = 'git-worktree' },
}

Plugin.opts = function()
  local actions = require('telescope.actions')

  return {
    defaults = {
      layout_strategy = 'vertical',
      layout_config = {
        vertical = {
          prompt_position = 'top',
          preview_cutoff = 10,
          width = 0.65,
          mirror = true,
        },
      },
      sorting_strategy = 'ascending',
      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<Esc>'] = actions.close,
        },
      },
    },
  }
end

Plugin.config = function(_, opts)
  local telescope = require('telescope')
  local builtin = require('telescope.builtin')

  telescope.setup(opts)
  telescope.load_extension('fzf')
  telescope.load_extension('git_worktree')

  local keymap = vim.keymap
  local map_opts = { silent = true }

  keymap.set('n', '<Space><C-p>', builtin.find_files, map_opts)
  keymap.set('n', '<M-x>', builtin.commands, map_opts)
  keymap.set('n', '<C-b>', builtin.buffers, map_opts)
  keymap.set('n', '<Space>h', builtin.help_tags, map_opts)
  keymap.set('n', '<Space>:', builtin.command_history, map_opts)
  keymap.set('n', '<Space>/', builtin.search_history, map_opts)
  keymap.set('n', '<Space>`', builtin.marks, map_opts)
  keymap.set('n', 'gs', builtin.live_grep, map_opts)
  keymap.set('x', 'gs', builtin.grep_string, map_opts)
  keymap.set('n', '<C-p>', builtin.git_files, map_opts)
  keymap.set('n', '<Space>gs', builtin.git_status, map_opts)
  keymap.set('n', '<C-f>', builtin.lsp_document_symbols, map_opts)
  keymap.set('n', '<Space>t', builtin.resume, map_opts)
  keymap.set('n', '<Space><C-o>', builtin.jumplist, map_opts)
  keymap.set('n', 'z=', builtin.spell_suggest, map_opts)
  keymap.set('n', '<Space>gwp', function()
    telescope.extensions.git_worktree.git_worktrees()
  end, map_opts)
  keymap.set('n', '<Space>gwa', function()
    telescope.extensions.git_worktree.create_git_worktree()
  end, map_opts)
end

return Plugin
