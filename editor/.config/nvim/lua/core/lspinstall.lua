local M = {}

M.setup = function()
  local lspinstall = require("lspinstall")
  lspinstall.setup()

  lspinstall.post_install_hook = function()
    vim.cmd("bufdo e")
  end
end

return M
