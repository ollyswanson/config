local lspinstall = require('lspinstall')
local lspconfig = require('lspconfig')
local on_attach = require('lsp.on_attach')
local utils = require('utils')
local make_capabilities = require('lsp.capabilities').make_capabilities

local function make_config()
  local capabilities = make_capabilities()

  return {capabilities = capabilities, on_attach = on_attach}
end

local function setup_servers()
  lspinstall.setup()

  local servers = lspinstall.installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()

    if server == "lua" then config.settings = require('lsp.lua') end

    if server == "rust" then config.settings = require('lsp.rust') end

    if server == "efm" then config = vim.tbl_extend("force", config, require("lsp.efm")) end

    if server ~= "java" then lspconfig[server].setup(config) end
  end

  utils.augroup('lsp_define', [[
    autocmd FileType java lua require('jdtls').start_or_attach(require('filetypes.java').jdtls_config())
  ]])
end

setup_servers()

-- Automatically reload after ":LspInstall <server>"
lspinstall.post_install_hook = function()
  setup_servers() -- Reload installed servers
  vim.cmd("bufdo e") -- This triggers the FileType autocmd that starts the server
end
