local M = {}

local wk = require("which-key").register
local dap = require("dap")
local jdtls = require("jdtls")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local common_capabilities = require("lsp").common_capabilities
local log = require("core.log")

function M.dap_run_test()
  dap.repl.open()
  jdtls.test_class()
end

function M.dap_run_test_nearest()
  dap.repl.open()
  jdtls.test_nearest_method()
end

function M.jdtls_config()
  local jdtls_bundles = {
    vim.fn.glob("~/bin/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
  }
  vim.list_extend(jdtls_bundles, vim.split(vim.fn.glob("~/bin/vscode-java-test/server/*.jar"), "\n"))
  local root_markers = { "gradlew", "pom.xml" }
  local root_dir = require("jdtls.setup").find_root(root_markers)
  local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
  extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

  return {
    capabilities = common_capabilities(),
    cmd = {
      require("lspinstall/util").install_path("java") .. "/jdtls.sh",
      vim.env.HOME .. "/.jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t"),
    },
    settings = {
      ["java.format.enabled"] = false,
      ["java.format.settings.url"] = vim.env.HOME .. "/eclipse-java-google-style.xml",
      ["java.format.settings.profile"] = "GoogleStyle",
      java = {
        signatureHelp = { enabled = true },
        contentProvider = { preferred = "fernflower" },
        completion = {
          favoriteStaticMembers = {
            "org.hamcrest.MatcherAssert.assertThat",
            "org.hamcrest.Matchers.*",
            "org.hamcrest.CoreMatchers.*",
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.Objects.requireNonNullElse",
            "org.mockito.Mockito.*",
            "org.mockito.BDDMockito.*",
          },
        },
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
      },
    },
    init_options = { bundles = jdtls_bundles, extendedClientCapabilities = extendedClientCapabilities },
    on_attach = function(client, bufnr)
      require("lsp.init").common_on_attach(client, bufnr)

      require("jdtls.setup").add_commands()
      require("jdtls").setup_dap({ hotcodereplace = "auto" })
      require("jdtls.dap").setup_dap_main_class_configs()
      require("mappings").dap_mappings(bufnr)

      require("jdtls.ui").pick_one_async = function(items, prompt, label_fn, cb)
        local opts = {}
        pickers.new(opts, {
          prompt_title = prompt,
          finder = finders.new_table({
            results = items,
            entry_maker = function(entry)
              return { value = entry, display = label_fn(entry), ordinal = label_fn(entry) }
            end,
          }),
          sorter = sorters.get_generic_fuzzy_sorter(),
          attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
              local selection = actions.get_selected_entry(prompt_bufnr)
              actions.close(prompt_bufnr)

              cb(selection.value)
            end)

            return true
          end,
        }):find()
      end

      wk({
        ["<leader>b"] = {
          r = { '<cmd>lua require("dap").continue()<CR>', "run" },
          t = { '<cmd>lua require("lsp.ft.java").dap_run_test()<CR>', "test file" },
          n = { '<cmd>lua require("lsp.ft.java").dap_run_test_nearest()<CR>', "test nearest" },
        },
        ["<leader>j"] = {
          R = { '<cmd>lua require("jdtls").code_action(false, "refactor")<CR>', "menu" },
          o = { '<cmd>lua require("jdtls").organize_imports()<CR>', "organize imports" },
          v = { '<cmd>lua require("jdtls").extract_variable()<CR>', "extract variable" },
        },
        ["<leader>ca"] = { '<cmd>lua require("jdtls").code_action()<CR>', "code actions" },
        ["<leader>f"] = {
          f = { "<cmd>PrettierAsync<CR>", "format" },
          c = { '<cmd>lua require("jdtls").update_project_config()<CR>', "reload" },
        },
      }, {
        buffer = bufnr,
      })

      wk({
        ["<leader>ca"] = { '<cmd>lua require("jdtls").code_action(true)<CR>', "code actions" },
        ["<leader>j"] = {
          m = { '<cmd>lua require("jdtls").extract_method(true)<CR>', "extract method" },
          v = { '<cmd>lua require("jdtls").extract_variable(true)<CR>', "extract variable" },
        },
      }, {
        buffer = bufnr,
        mode = "v",
      })
    end,
  }
end

return M