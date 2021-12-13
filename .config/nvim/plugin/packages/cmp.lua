local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = {
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete()),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping(cmp.mapping.close()),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))

        return col ~= 0
          and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
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
    { name = 'luasnip' },
    { name = 'calc' },
  }, {
    { name = 'buffer' },
  }),
})
