local Plugin = { 'cbochs/grapple.nvim' }

Plugin.name = 'grapple'

Plugin.cmd = 'Grapple'
Plugin.event = { 'BufReadPost', 'BufNewFile' }

Plugin.opts = {
  scope = 'git', -- also try out "git_branch"
}

Plugin.keys = {
  {
    '<Space>m',
    function()
      require('grapple').toggle()
      vim.cmd.redrawtabline()
    end,
    desc = 'Grapple toggle tag',
  },
  {
    '<Space>M',
    '<cmd>Grapple toggle_tags<cr>',
    desc = 'Grapple open tags window',
  },
  {
    '<Space>n',
    '<cmd>Grapple cycle_tags next<cr>',
    desc = 'Grapple cycle next tag',
  },
  {
    '<Space>p',
    '<cmd>Grapple cycle_tags prev<cr>',
    desc = 'Grapple cycle previous tag',
  },
}

return Plugin
