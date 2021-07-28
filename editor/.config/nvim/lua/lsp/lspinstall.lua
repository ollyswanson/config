local lspinstall = require('lspinstall')
local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')

local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  return {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

local function setup_servers()
  lspinstall.setup()

  local servers = lspinstall.installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()

    if server == "lua" then
      config.settings = require('lsp.lua')
    end

    if server == "efm" then
      config = vim.tbl_extend("force", config, require("lsp.efm"))
    end

    lspconfig[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after ":LspInstall <server>"
lspinstall.post_install_hook = function()
  setup_servers() -- Reload installed servers
  vim.cmd("bufdo e") -- This triggers the FileType autocmd that starts the server
end