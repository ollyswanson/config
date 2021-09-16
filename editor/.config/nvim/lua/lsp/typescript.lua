local lsp_config = require "lspconfig"
local on_attach = require "lsp.on_attach"

lsp_config.tsserver.setup {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_dir = lsp_config.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
}
