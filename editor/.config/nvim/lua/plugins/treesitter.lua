local read_query = function(filename)
  return table.concat(vim.fn.readfile(vim.fn.expand(filename)))
end

require('nvim-treesitter.configs').setup({
  ensure_installed = {},
  highlight = {
    enable = true,
    queries = {
      --           rust = read_query("~/.config/nvim/queries/rust/highlights.scm")
    }
  },
  indent = {enable = true, disable = {"rust", "tsx", "typescript"}},
  incremental_selection = {enable = true},
  textobjects = {enable = true},
  refactor = {
    highlight_definitions = {enable = true},
    smart_rename = {enable = true, keymaps = {smart_rename = "grr"}}
  }
})
