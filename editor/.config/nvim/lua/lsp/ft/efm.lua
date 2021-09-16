local utils = require("utils")

local lua = {
  formatCommand = "stylua --config-path ~/configs/editor/.config/nvim/.stylua.toml -",
  formatStdin = true,
}

utils.nvim_create_augroups({
  LuaFormat = { "BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)" },
})

local eslint = {
  lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}

local languages = {
  lua = { lua },
  javascript = { eslint },
  typescript = { eslint },
  javascriptreact = { eslint },
  typescriptreact = { eslint },
}

return {
  filetypes = vim.tbl_keys(languages),
  init_options = { documentFormatting = true },
  settings = { rootMarkers = { "package.json", ".git/", ".stylua.toml" }, languages = languages },
}
