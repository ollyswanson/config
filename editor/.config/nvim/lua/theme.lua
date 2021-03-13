local apply_colorscheme = require('utils').apply_colorscheme

vim.g.gruvbox_material_palette = 'material'
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_enable_italic = false
vim.g.gruvbox_material_disable_italic_comment = true
vim.g.gruvbox_material_transparent_background = false
vim.g.gruvbox_material_diagnostic_line_highlight = true
vim.g.gruvbox_material_better_performance = true

apply_colorscheme('gruvbox-material', 'dark')
