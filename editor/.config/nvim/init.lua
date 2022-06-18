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
