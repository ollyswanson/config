local M = {}

local colors = require('nightfox.colors').init("nordfox")

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end
}

local config = {
  options = {
    theme = 'nightfox',
    icons_enabled = true,
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {lualine_a = {'mode'}, lualine_c = {}, lualine_x = {}, lualine_y = {'filetype'}}
}

-- insert components into left hand side of statusline
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- insert components into right hand side of statusline
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {'filename', condition = conditions.buffer_not_empty}

ins_left {
  'diagnostics',
  sources = {'nvim_lsp'},
  symbols = {error = ' ', warn = ' ', info = ' '},
  color_error = colors.red,
  color_warn = colors.yellow,
  color_info = colors.cyan
}

ins_left {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then return client.name end
    end
    return msg
  end,
  icon = ' LSP:'
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = {added = ' ', modified = '柳 ', removed = ' '},
  color_added = colors.green,
  color_modified = colors.orange,
  color_removed = colors.red,
  condition = conditions.hide_in_width
}

ins_right {'encoding', condition = conditions.hide_in_width}

ins_right {'fileformat', condition = conditions.hide_in_width}

function M.setup()
  return config
end

return M

