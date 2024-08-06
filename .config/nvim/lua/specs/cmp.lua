local Plugin = { 'hrsh7th/nvim-cmp' }

Plugin.name = 'cmp'

Plugin.event = 'InsertEnter'

Plugin.dependencies = {
  { 'hrsh7th/cmp-buffer', name = 'cmp-buffer' },
  { 'hrsh7th/cmp-calc', name = 'cmp-calc' },
  { 'hrsh7th/cmp-cmdline', name = 'cmp-cmdline' },
  { 'hrsh7th/cmp-nvim-lsp', name = 'cmp-lsp' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help', name = 'cmp-lsp-signature-help' },
  { 'hrsh7th/cmp-path', name = 'cmp-path' },
  'autopairs',
}

Plugin.opts = function()
  local cmp = require('cmp')

  local kind_icons = {
    Text = '',
    Method = '󰆧',
    Function = '󰊕',
    Constructor = '',
    Field = '󰇽',
    Variable = '󰀫',
    Class = '󰠱',
    Interface = '',
    Module = '',
    Property = '󰜢',
    Unit = '',
    Value = '󰎠',
    Enum = '',
    Keyword = '󰌋',
    Snippet = '',
    Color = '󰏘',
    File = '󰈙',
    Reference = '',
    Folder = '󰉋',
    EnumMember = '',
    Constant = '󰏿',
    Struct = '',
    Event = '',
    Operator = '󰆕',
    TypeParameter = '󰅲',
  }

  return {
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    window = {
      documentation = {
        max_width = 60,
        max_height = 15,
      },
    },
    experimental = {
      ghost_text = true,
    },
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(_, item)
        local label_width = 20
        local label = item.abbr
        local truncated_label = vim.fn.strcharpart(label, 0, label_width)

        if truncated_label ~= label then
          item.abbr = truncated_label .. '…'
        elseif string.len(label) < label_width then
          local padding = string.rep(' ', label_width - string.len(label))
          item.abbr = label .. padding
        end

        item.menu = item.kind
        item.kind = kind_icons[item.kind]
        return item
      end,
    },
    mapping = {
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete()),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        local function has_words_before()
          local row_position, column_position =
            unpack(vim.api.nvim_win_get_cursor(0))

          if column_position == 0 then
            return false
          end

          local current_line = vim.api.nvim_buf_get_lines(
            0,
            row_position - 1,
            row_position,
            false
          )[1]
          local character_at_cursor =
            current_line:sub(column_position + 1, column_position + 1)

          return character_at_cursor:match('%s') == nil
        end

        if cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'calc' },
    }, {
      { name = 'buffer' },
    }),
  }
end

Plugin.config = function(_, opts)
  local cmp = require('cmp')
  local autopairs_cmp_completion = require('nvim-autopairs.completion.cmp')

  cmp.setup(opts)

  cmp.setup.cmdline(':', {
    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    }),
  })

  cmp.setup.cmdline({ '/', '?' }, {
    completion = {
      completeopt = 'menu,menuone,noinsert,noselect',
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })

  cmp.event:on('confirm_done', autopairs_cmp_completion.on_confirm_done())
end

return Plugin
