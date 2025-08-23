local Plugin = { 'hrsh7th/nvim-cmp' }

Plugin.name = 'cmp'

Plugin.event = 'InsertEnter'

Plugin.dependencies = {
  { 'hrsh7th/cmp-buffer', name = 'cmp-buffer' },
  { 'hrsh7th/cmp-calc', name = 'cmp-calc' },
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
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        local has_words_before = function()
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0
            and vim.api
                .nvim_buf_get_lines(0, line - 1, line, true)[1]
                :sub(col, col)
                :match('%s')
              == nil
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
  local cmp_lsp = require('cmp_nvim_lsp')
  local autopairs_cmp_completion = require('nvim-autopairs.completion.cmp')

  cmp.setup(opts)

  vim.lsp.config('*', {
    capabilities = cmp_lsp.default_capabilities(),
  })

  cmp.event:on('confirm_done', autopairs_cmp_completion.on_confirm_done())
end

return Plugin
