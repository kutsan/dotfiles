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
  { 'debugloop/telescope-undo.nvim', name = 'telescope-undo' },
}

local function get_telescope_width()
  local term_width = vim.o.columns
  return term_width <= 100 and 0.9 or 0.65
end

Plugin.opts = function()
  local actions = require('telescope.actions')

  return {
    defaults = {
      prompt_title = '',
      results_title = '',
      preview_title = '',
      prompt_prefix = '   ',
      selection_caret = ' ',
      entry_prefix = ' ',
      sorting_strategy = 'ascending',
      layout_strategy = 'vertical',
      layout_config = {
        vertical = {
          prompt_position = 'top',
          preview_cutoff = 10,
          width = get_telescope_width(),
          mirror = true,
        },
      },
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
  telescope.load_extension('undo')

  -- Resize telescope window when the terminal is resized.
  vim.api.nvim_create_autocmd('VimResized', {
    group = vim.api.nvim_create_augroup(
      'TelescopeAdjustWidth',
      { clear = true }
    ),
    callback = function()
      telescope.setup({
        defaults = {
          layout_config = {
            vertical = {
              width = get_telescope_width(),
            },
          },
        },
      })
    end,
  })

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
  keymap.set('n', '<Space>u', telescope.extensions.undo.undo, map_opts)
end

return Plugin
