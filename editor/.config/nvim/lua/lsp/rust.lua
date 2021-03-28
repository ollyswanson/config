local lsp_config = require('lspconfig')
local on_attach = require('lsp.on_attach')

lsp_config.rust_analyzer.setup({
  cmd = {"rust-analyzer"},
  filetypes = {"rust"},
  on_attach = on_attach,
  capabilities = require('lsp-status').capabilities,
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {enable = true, disabled = {"unresolved-proc-macro"}, enableExperimental = true}
    }
  }
})
