local map = require('utils').map;
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {["<CR>"] = actions.select_default + actions.center},
      n = {["<CR>"] = actions.select_default + actions.center}
    },
    file_ignore_patterns = {
      '.git/*', 'node_modules/*', 'bower_components/*', '.svn/*', '.hg/*', 'CVS/*', '.next/*',
      '.docz/*', '.DS_Store'
    },
    layout_strategy = 'flex',
    scroll_strategy = 'cycle'
  }
}

local options = {noremap = true}

map('n', '<C-p>', '<cmd>lua require("telescope.builtin").find_files()<CR>', options)
map('n', '<Leader>lg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', options)
map('n', '<Leader>sb', '<cmd>lua require("telescope.builtin").buffers()<CR>', options)
map('n', '<Leader>t', '<cmd>lua require("telescope.builtin").help_tags()<CR>', options)
map('n', '<Leader>rf', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', options)
map('n', '<Leader>rg', '<cmd>lua require("telescope.builtin").grep_string()<CR>', options)
map('n', '<Leader>rf', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', options)
map('n', '<Leader>wd', '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>',
    options)
map('n', '<Leader>p', '<cmd>lua require("telescope.builtin").file_browser()<CR>', options)
