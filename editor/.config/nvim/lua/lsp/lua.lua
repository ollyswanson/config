local on_attach = require('lsp.on_attach')

USER = vim.fn.expand('$USER')

-- OSX
local sumneko_root_path = "/Users/" .. USER .. "/language-servers/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

local lsp_config = require('lspconfig')

lsp_config.sumneko_lua.setup({
  on_attach = on_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
	Lua = {
    runtime = {
      -- Tell the language server which version to use (LuaJIT in the case of neovim)
      version = 'LuaJIT',
      -- Setup your Lua path
      path = vim.split(package.path, ';')
    },
    -- Get the language server to recognize the vim global
    diagnostics = {
      globals = {'vim', 'use'}
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },},
    },
  },
})
