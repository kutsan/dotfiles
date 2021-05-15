local pears = require("pears")

pears.setup(function(config)
  config.on_enter(function(pears_handle)
    if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
      return vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<C-y>", true, false, true),
        'i',
        true
      )
    else
      pears_handle()
    end
  end)
end)
