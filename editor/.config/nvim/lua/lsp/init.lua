local M = {}

require("lsp.settings")
local Log = require("core.log")

-- local function lsp_highlight_document(client)
--   if lvim.lsp.document_highlight == false then
--     return -- we don't need further
--   end
--   -- Set autocommands conditional on server_capabilities
--   if client.resolved_capabilities.document_highlight then
--     vim.api.nvim_exec(
--       [[
--       hi LspReferenceRead cterm=bold ctermbg=red guibg=#353d46
--       hi LspReferenceText cterm=bold ctermbg=red guibg=#353d46
--       hi LspReferenceWrite cterm=bold ctermbg=red guibg=#353d46
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]],
--       false
--     )
--   end
-- end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  capabilities.workspace.configuration = true

  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  end

  return capabilities
end

function M.get_ls_capabilities(client_id)
  local client
  if not client_id then
    local buf_clients = vim.lsp.buf_get_clients()
    for _, buf_client in ipairs(buf_clients) do
      if buf_client.name ~= "null-ls" then
        client_id = buf_client.id
        break
      end
    end
  end
  if not client_id then
    error("Unable to determine client_id")
  end

  client = vim.lsp.get_client_by_id(tonumber(client_id))

  local enabled_caps = {}

  for k, v in pairs(client.resolved_capabilities) do
    if v == true then
      table.insert(enabled_caps, k)
    end
  end

  return enabled_caps
end

function M.common_on_init(client, bufnr)
  -- if lvim.lsp.on_init_callback then
  --   lvim.lsp.on_init_callback(client, bufnr)
  --   Log:debug "Called lsp.on_init_callback"
  --   return
  -- end

  local formatters = olsp.lang[vim.bo.filetype].formatters
  if not vim.tbl_isempty(formatters) and formatters[1]["exe"] ~= nil and formatters[1].exe ~= "" then
    client.resolved_capabilities.document_formatting = false
    Log:debug(
      string.format("Overriding language server [%s] with format provider [%s]", client.name, formatters[1].exe)
    )
  end
end

function M.common_on_attach(client, bufnr)
  -- if lvim.lsp.on_attach_callback then
  --   lvim.lsp.on_attach_callback(client, bufnr)
  --   Log:debug "Called lsp.on_init_callback"
  -- end
  -- lsp_highlight_document(client)
  require("mappings").lsp_mappings(client, bufnr)
  local ft = vim.bo.filetype
  if ft ~= "java" then
    require("lsp.null-ls").setup(vim.bo.filetype)
  end
end

function M.setup(lang)
  local lsp_utils = require("lsp.utils")
  local lsp = olsp.lang[lang].lsp
  if (lsp.active ~= nil and not lsp.active) or lsp_utils.is_client_active(lsp.provider) then
    return
  end

  local overrides = olsp.override
  if type(overrides) == "table" then
    if vim.tbl_contains(overrides, lang) then
      return
    end
  end

  if lsp.provider ~= nil and lsp.provider ~= "" then
    local lspconfig = require("lspconfig")

    if not lsp.setup.on_attach then
      lsp.setup.on_attach = M.common_on_attach
    end
    if not lsp.setup.on_init then
      lsp.setup.on_init = M.common_on_init
    end
    if not lsp.setup.capabilities then
      lsp.setup.capabilities = M.common_capabilities()
    end

    lspconfig[lsp.provider].setup(lsp.setup)
  end
end

function M.global_setup()
  vim.lsp.protocol.CompletionItemKind = olsp.completion.item_kind

  for _, sign in ipairs(olsp.diagnostics.signs.values) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  require("lsp.handlers").setup()

  local null_status_ok, null_ls = pcall(require, "null-ls")
  if null_status_ok then
    null_ls.config()
    require("lspconfig")["null-ls"].setup(olsp.null_ls.setup)
  end

  local lsp_settings_status_ok, lsp_settings = pcall(require, "nlspsettings")
  if lsp_settings_status_ok then
    lsp_settings.setup({
      config_home = vim.env.HOME .. "/.config/nvim/lsp-settings",
    })
  end
end

return M
