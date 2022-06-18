local null_ls = require("null-ls")
local M = {}

function M.setup()
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
    }
  })
end

return M
