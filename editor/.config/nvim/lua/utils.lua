local M = {}

function M.add(value, str, sep)
  sep = sep or ","
  str = str or ""
  value = type(value) == "table" and table.concat(value, sep) or value
  return str ~= "" and table.concat({value, str}, sep) or value
end

function M.concat(value)
  return table.concat(value)
end

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

-- option set
function M.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- Map keys
function M.map(mode, key, fn, opts)
  vim.api.nvim_set_keymap(mode, key, fn, opts or {})
end

-- Buffer local keymap
function M.buf_map(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end

function M.apply_colorscheme(name, mode)
    M.opt('o', 'termguicolors', true)
    M.opt('o', 'guicursor', 'n-v-c-sm:block,i-ci-ve:ver50-Cursor,r-cr-o:hor50')
    M.opt('o', 'background', mode)

    vim.g.colors_name = name
end

return M