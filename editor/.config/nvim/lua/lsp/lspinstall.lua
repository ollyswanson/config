local lspinstall = require("lspinstall")
local lspconfig = require("lspconfig")
local on_attach = require("lsp.on_attach")
local make_capabilities = require("lsp.capabilities").make_capabilities

local function make_config()
  local capabilities = make_capabilities()

  return { capabilities = capabilities, on_attach = on_attach }
end

local function setup_servers()
  lspinstall.setup()

  local servers = lspinstall.installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()

    if server == "lua" then
      config.settings = require("lsp.ft.lua")
    end

    if server == "rust" then
      config.settings = require("lsp.ft.rust")
    end

    if server == "efm" then
      config = vim.tbl_extend("force", config, require("lsp.ft.efm"))
    end

    if server ~= "java" then
      lspconfig[server].setup(config)
    end
  end
end

setup_servers()

-- Automatically reload after ":LspInstall <server>"
lspinstall.post_install_hook = function()
  setup_servers() -- Reload installed servers
  vim.cmd("bufdo e")
end
