local lua_settings = {
  Lua = {
    runtime = {
      -- Tell the language server which version to use (LuaJIT in the case of neovim)
      version = 'LuaJIT',
      -- Setup your Lua path
      path = vim.split(package.path, ';')
    },
    -- Get the language server to recognize the vim global
    diagnostics = {globals = {'vim', 'use'}},
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
      }
    }
  }
}

return lua_settings
