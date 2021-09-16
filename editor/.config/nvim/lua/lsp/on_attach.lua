local nvim_status = require("lsp-status")

local on_attach = function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

  require("mappings").lsp_mappings(client, bufnr)

  -- tjdevries/config-manager
  if filetype == "rust" then
    vim.cmd(
      [[autocmd InsertLeave,BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request { ]]
        .. [[aligned = true, prefix = " » ", enabled = {"TypeHint", "ChainingHint"} ]]
        .. [[} ]]
    )
  end

  nvim_status.on_attach(client)
end

return on_attach
