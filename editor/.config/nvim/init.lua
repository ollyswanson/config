vim.g.mapleader = " "

require("core")
require("settings")
require("mappings").define_mappings()
require("lsp").setup()
require("core.autocmds").define_augroups({
  general = {
    {
      "BufWritePre",
      "*",
      ":silent lua vim.lsp.buf.formatting_sync()",
    },
  },
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})
