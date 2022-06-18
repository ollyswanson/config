local M = {}

-- This will probably be really useful
local opts = {
  tools = { -- rust-tools options
    inlay_hints = {
      show_parameter_hints = true,
      -- prefix for parameter hints
      parameter_hints_prefix = "◄",
      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "❯❯",
      max_len_align = true,
      max_len_align_padding = 4,
    },
  },
  server = {
    cmd = { vim.fn.stdpath("data") .. "/lspinstall/rust/rust-analyzer" },
    on_attach = require("lsp").common_on_attach,
    on_init = require("lsp").common_on_init,
  },
}

M.setup = function()
  require("rust-tools").setup(opts)
end

return M
