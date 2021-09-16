vim.g.mapleader = " "

require("core")
require("settings")
require("mappings").define_mappings()
require("lsp").global_setup()
require("theme")
require("core.autocmds").define_augroups({
  general = {
    {
      "BufWritePre",
      "*",
      ":silent lua vim.lsp.buf.formatting_sync()",
    },
    {
      "Filetype",
      "*",
      "lua require('utils.ft').do_filetype(vim.fn.expand(\"<amatch>\"))",
    },
  },
})
