local M = {}

M.setup = function()
  require("nvim-tree").setup({
    disable_netrw = false,
    hijack_netrw = true,
    auto_close = true,
  })
end

return M
