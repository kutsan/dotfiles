local Plugin = { 'folke/snacks.nvim' }

Plugin.name = 'snacks'

Plugin.priority = 1000
Plugin.lazy = false

local function get_projects()
  local home = vim.fn.expand('~')

  -- TODO
  local base_projects_path = home .. '/Documents/Projects'

  local potential_project_dirs =
    vim.fn.globpath(base_projects_path, '*/*', true, true)

  local projects = {}

  for _, path in ipairs(potential_project_dirs) do
    if vim.fn.isdirectory(path) == 1 then
      table.insert(projects, path)
    end
  end

  return projects
end

Plugin.opts = {
  zen = { enabled = true, toggles = { dim = false } },
  input = { enabled = true },
  -- statuscolumn = { enabled = true },
  toggle = { enabled = true },
  -- scroll = {
  --   enabled = true,
  --   animate = {
  --     duration = { step = 5, total = 50 },
  --     easing = 'linear',
  --   },
  -- },
  explorer = {
    enabled = true,
    replace_netrw = true,
  },
  picker = {
    icons = {
      tree = {
        vertical = '│ ',
        middle = '│ ',
        last = '│ ',
      },
    },
    layout = {
      preset = 'vertical',
    },
    enabled = true,
    sources = {
      files = {
        hidden = true,
        ignored = vim.fn.getcwd() == vim.uv.os_homedir(),
      },
      grep = {
        hidden = true,
        ignored = vim.fn.getcwd() == vim.uv.os_homedir(),
      },
      explorer = {
        focus = 'list',
        ignored = true,
        hidden = true,
        git_untracked = true,
        win = {
          list = {
            keys = {
              ['/'] = false,
              ['?'] = false,
            },
          },
        },
        layout = {
          layout = {
            zindex = 0,
            box = 'vertical',
            position = 'left',
            width = 40,
            -- {
            --   win = 'input',
            --   max_height = 1,
            --   height = 1,
            --   border = { '', '', '', '', '', '', '', ' ' },
            --   wo = {
            --     winhighlight = 'FloatBorder:CursorColumn,NormalFloat:CursorColumn,SnacksPickerPrompt:SnacksPickerPromptTransparent',
            --   },
            -- },
            {
              win = 'list',
              border = 'none',
              wo = {
                winhighlight = 'FloatBorder:CursorColumn,NormalFloat:CursorColumn',
              },
            },
          },
        },
        -- layout = {
        --   layout = {
        --     backdrop = false,
        --     width = 40,
        --     min_width = 40,
        --     height = 0,
        --     position = 'left',
        --     border = 'none',
        --     box = 'vertical',
        --     { win = 'list', border = 'none' },
        --     {
        --       win = 'preview',
        --       title = '{preview}',
        --       height = 0.4,
        --       border = 'top',
        --     },
        -- },
        -- },
      },
      projects = {
        dev = get_projects(),
        confirm = function(picker, item)
          picker:close()

          local snacks = require('snacks')

          if item and item.file then
            -- Check if the project is already open by checking the cwd of each tab
            local tabpages = vim.api.nvim_list_tabpages()
            for _, tabpage in ipairs(tabpages) do
              local tab_cwd = vim.fn.getcwd(-1, tabpage)
              if tab_cwd == item.file then
                -- Change to the tab
                vim.api.nvim_set_current_tabpage(tabpage)
                return
              end
            end

            -- If there are already opened buffers, open a new tab
            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
              if
                vim.api.nvim_buf_is_loaded(bufnr)
                and vim.api.nvim_buf_get_name(bufnr) ~= ''
              then
                vim.cmd('tabnew')
                break
              end
            end

            -- Change cwd to the selected project, only for this tab
            vim.cmd('tcd ' .. vim.fn.fnameescape(item.file))
            snacks.picker.smart()
          end
        end,
      },
    },
  },
}

-- keymap.set('n', '<Space>gs', builtin.git_status, map_opts)
-- keymap.set('n', '<C-f>', builtin.lsp_document_symbols, map_opts)
-- keymap.set('n', '<Space>t', builtin.resume, map_opts)
-- keymap.set('n', '<Space><C-o>', builtin.jumplist, map_opts)
-- keymap.set('n', 'z=', builtin.spell_suggest, map_opts)
-- keymap.set('n', '<Space>o', function()
--   builtin.oldfiles({ only_cwd = true })
-- end, map_opts)
Plugin.keys = {
  {
    '<C-b>',
    function()
      local snacks = require('snacks')
      snacks.picker.buffers()
    end,
    desc = 'Buffers',
  },
  {
    '<Space><C-p>',
    function()
      local snacks = require('snacks')
      snacks.picker.files()
    end,
    desc = 'Find Files',
  },
  {
    '<C-p>',
    function()
      local snacks = require('snacks')
      snacks.picker.git_files()
    end,
    desc = 'Find Files',
  },
  {
    '<Space>s"',
    function()
      local snacks = require('snacks')
      snacks.picker.registers()
    end,
    desc = 'Registers',
  },
  {
    '<Space>h',
    function()
      local snacks = require('snacks')
      snacks.picker.help()
    end,
    desc = 'Help Pages',
  },
  {
    'gs',
    function()
      local snacks = require('snacks')
      snacks.picker.grep()
    end,
    desc = 'Grep',
  },
  {
    'gs',
    function()
      local snacks = require('snacks')
      snacks.picker.grep_word()
    end,
    desc = 'Visual selection or word',
    mode = { 'x' },
  },
  {
    '<Space>f',
    function()
      local snacks = require('snacks')
      snacks.explorer.open()
    end,
    desc = 'File Explorer',
  },
  {
    '<Space>F',
    function()
      local snacks = require('snacks')
      snacks.explorer.reveal()
    end,
    desc = 'Reveal in Explorer',
  },
  {
    '<Space>u',
    function()
      local snacks = require('snacks')
      snacks.picker.undo()
    end,
    desc = 'Undo history',
  },
  {
    '<M-x>',
    function()
      local snacks = require('snacks')
      snacks.picker.commands()
    end,
    desc = 'Commands',
  },
  {
    '<Space>sH',
    function()
      local snacks = require('snacks')
      snacks.picker.highlights()
    end,
    desc = 'Highlights',
  },
  {
    '<Space>z',
    function()
      local snacks = require('snacks')
      snacks.zen()
    end,
    desc = 'Zen Mode',
  },
  {
    '<Space>:',
    function()
      local snacks = require('snacks')
      snacks.picker.command_history()
    end,
  },
  {
    '<Space>/',
    function()
      local snacks = require('snacks')
      snacks.picker.search_history()
    end,
  },
  {
    '<Space>`',
    function()
      local snacks = require('snacks')
      snacks.picker.marks()
    end,
  },
  {
    '<Space>gR',
    function()
      local snacks = require('snacks')
      snacks.picker.resume()
    end,
  },
  {
    '<Space>td',
    function()
      local snacks = require('snacks')
      snacks.picker.todo_comments()
    end,
  }
  -- {
  --   'gd',
  --   function()
  --     Snacks.picker.lsp_definitions()
  --   end,
  --   desc = 'Goto Definition',
  -- },
  -- {
  --   'gD',
  --   function()
  --     Snacks.picker.lsp_declarations()
  --   end,
  --   desc = 'Goto Declaration',
  -- },
  -- {
  --   'gr',
  --   function()
  --     Snacks.picker.lsp_references()
  --   end,
  --   nowait = true,
  --   desc = 'References',
  -- },
  -- {
  --   'gI',
  --   function()
  --     Snacks.picker.lsp_implementations()
  --   end,
  --   desc = 'Goto Implementation',
  -- },
  -- {
  --   'gy',
  --   function()
  --     Snacks.picker.lsp_type_definitions()
  --   end,
  --   desc = 'Goto T[y]pe Definition',
  -- },
  -- {
  --   '<leader>ss',
  --   function()
  --     Snacks.picker.lsp_symbols()
  --   end,
  --   desc = 'LSP Symbols',
  -- },
  -- {
  --   '<leader>sS',
  --   function()
  --     Snacks.picker.lsp_workspace_symbols()
  --   end,
  --   desc = 'LSP Workspace Symbols',
  -- },
}

-- Plugin.init = function()
--   vim.api.nvim_create_autocmd('User', {
--     pattern = 'VeryLazy',
--     callback = function()
--       local snacks = require('snacks')
--       snacks.toggle.option('spell', { name = 'Spelling' }):map('<Space>us')
--     end,
--   })
-- end

return Plugin

