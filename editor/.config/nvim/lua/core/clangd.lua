local M = {}

local opts = {
  server = {
    cmd = { vim.fn.stdpath("data") .. "/lsp_servers/clangd/clangd/bin/clangd" },
    on_attach = require("lsp").common_on_attach,
    on_init = require("lsp").common_on_init,
  }
}

M.setup = function()
  require("clangd_extensions").setup(opts)
end

return M
