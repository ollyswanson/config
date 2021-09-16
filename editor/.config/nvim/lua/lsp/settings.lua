local ls_install_prefix = vim.fn.stdpath("data") .. "/lspinstall"

-- Get schemas for language server settings
local schemas = nil
local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
  schemas = jsonls_settings.get_default_schemas()
end

olsp = {
  completion = {
    item_kind = {
      "   (Text) ",
      "   (Method)",
      "   (Function)",
      "   (Constructor)",
      "   (Field)",
      "   (Variable)",
      "   (Class)",
      " ﰮ  (Interface)",
      "   (Module)",
      "   (Property)",
      " 塞 (Unit)",
      "   (Value)",
      " 練 (Enum)",
      "   (Keyword)",
      "   (Snippet)",
      "   (Color)",
      "   (File)",
      "   (Reference)",
      "   (Folder)",
      "   (EnumMember)",
      " ﲀ  (Constant)",
      "   (Struct)",
      "   (Event)",
      "   (Operator)",
      "   (TypeParameter)",
    },
  },
  diagnostics = {
    signs = {
      active = true,
      values = {
        { name = "LspDiagnosticsSignError", text = "" },
        { name = "LspDiagnosticsSignWarning", text = "" },
        { name = "LspDiagnosticsSignHint", text = "" },
        { name = "LspDiagnosticsSignInformation", text = "" },
      },
    },
    severity_sort = true,
    underline = true,
    update_in_insert = false,
  },
  document_highlight = true,
  popup_border = "single",
  null_ls = { setup = {} },
  override = { "java" },
  lang = {
    asm = {
      formatters = {
        -- {
        --   exe = "asmfmt",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "",
        setup = {},
      },
    },
    c = {
      formatters = {
        -- {
        --   exe = "clang_format",
        --   args = {},
        -- },
        -- {
        --   exe = "uncrustify",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "clangd",
        setup = {
          cmd = {
            ls_install_prefix .. "/cpp/clangd/bin/clangd",
            "--background-index",
            "--header-insertion=never",
            "--cross-file-rename",
            "--clang-tidy",
            "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
          },
        },
      },
    },
    cpp = {
      formatters = {
        -- {
        --   exe = "clang_format",
        --   args = {},
        -- },
        -- {
        --   exe = "uncrustify",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "clangd",
        setup = {
          cmd = {
            ls_install_prefix .. "/cpp/clangd/bin/clangd",
            "--background-index",
            "--header-insertion=never",
            "--cross-file-rename",
            "--clang-tidy",
            "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
          },
        },
      },
    },
    cs = {
      formatters = {
        -- {
        --   exe = "clang_format ",
        --   args = {},
        -- },
        -- {
        --   exe = "uncrustify",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "omnisharp",
        setup = {
          cmd = {
            ls_install_prefix .. "/csharp/omnisharp/run",
            "--languageserver",
            "--hostPID",
            tostring(vim.fn.getpid()),
          },
        },
      },
    },
    cmake = {
      formatters = {
        -- {
        --   exe = "cmake_format",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "cmake",
        setup = {
          cmd = {
            ls_install_prefix .. "/cmake/venv/bin/cmake-language-server",
          },
        },
      },
    },
    css = {
      formatters = {
        -- {
        --   exe = "prettier",
        --   args = {},
        -- },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "cssls",
        setup = {
          cmd = {
            "node",
            ls_install_prefix .. "/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
            "--stdio",
          },
        },
      },
    },
    dockerfile = {
      formatters = {},
      linters = {},
      lsp = {
        provider = "dockerls",
        setup = {
          cmd = {
            ls_install_prefix .. "/dockerfile/node_modules/.bin/docker-langserver",
            "--stdio",
          },
        },
      },
    },
    fish = {
      formatters = {
        -- {
        --   exe = "fish_indent",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "",
        setup = {},
      },
    },
    go = {
      formatters = {
        -- {
        --   exe = "gofmt",
        --   args = {},
        -- },
        -- {
        --   exe = "goimports",
        --   args = {},
        -- },
        -- {
        --   exe = "gofumpt",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "gopls",
        setup = {
          cmd = {
            ls_install_prefix .. "/go/gopls",
          },
        },
      },
    },
    graphql = {
      formatters = {},
      linters = {},
      lsp = {
        provider = "graphql",
        setup = {
          cmd = {
            "graphql-lsp",
            "server",
            "-m",
            "stream",
          },
        },
      },
    },
    html = {
      formatters = {
        -- {
        --   exe = "prettier",
        --   args = {},
        -- },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "html",
        setup = {
          cmd = {
            "node",
            ls_install_prefix .. "/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
            "--stdio",
          },
        },
      },
    },
    json = {
      formatters = {
        -- {
        --   exe = "json_tool",
        --   args = {},
        -- },
        -- {
        --   exe = "prettier",
        --   args = {},
        -- },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "jsonls",
        setup = {
          cmd = {
            "node",
            ls_install_prefix .. "/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
            "--stdio",
          },
          settings = {
            json = {
              schemas = schemas,
              --   = {
              --   {
              --     fileMatch = { "package.json" },
              --     url = "https://json.schemastore.org/package.json",
              --   },
              -- },
            },
          },
          commands = {
            Format = {
              function()
                vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
              end,
            },
          },
        },
      },
    },
    lua = {
      formatters = {
        {
          exe = "stylua",
        },
        -- {
        --   exe = "lua_format",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "sumneko_lua",
        setup = {
          cmd = {
            ls_install_prefix .. "/lua/sumneko-lua-language-server",
            "-E",
            ls_install_prefix .. "/lua/main.lua",
          },
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim", "use", "olsp" },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 1000,
              },
            },
          },
        },
      },
    },
    nginx = {
      formatters = {
        -- {
        --   exe = "nginx_beautifier",
        --   args = {
        --     provider = "",
        --     setup = {},
        --   },
        -- },
      },
      linters = {},
      lsp = {},
    },
    sql = {
      formatters = {
        -- {
        --   exe = "sqlformat",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "sqls",
        setup = {
          cmd = { "sqls" },
        },
      },
    },
    javascript = {
      formatters = {
        -- {
        --   exe = "prettier",
        --   args = {},
        -- },
        -- {
        --   exe = "prettier_d_slim",
        --   args = {},
        -- },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      -- @usage can be {"eslint"} or {"eslint_d"}
      linters = {},
      lsp = {
        provider = "tsserver",
        setup = {
          cmd = {
            -- TODO:
            ls_install_prefix .. "/typescript/node_modules/.bin/typescript-language-server",
            "--stdio",
          },
        },
      },
    },
    javascriptreact = {
      formatters = {
        -- {
        --   exe = "prettier",
        --   args = {},
        -- },
        -- {
        --   exe = "prettier_d_slim",
        --   args = {},
        -- },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "tsserver",
        setup = {
          cmd = {
            -- TODO:
            ls_install_prefix .. "/typescript/node_modules/.bin/typescript-language-server",
            "--stdio",
          },
        },
      },
    },
    python = {
      formatters = {
        -- {
        --   exe = "yapf",
        --   args = {},
        -- },
        -- {
        --   exe = "isort",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "pyright",
        setup = {
          cmd = {
            ls_install_prefix .. "/python/node_modules/.bin/pyright-langserver",
            "--stdio",
          },
        },
      },
    },
    -- R -e 'install.packages("formatR",repos = "http://cran.us.r-project.org")'
    -- R -e 'install.packages("readr",repos = "http://cran.us.r-project.org")'
    ruby = {
      formatters = {
        -- {
        --   exe = "rufo",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "solargraph",
        setup = {
          cmd = {
            ls_install_prefix .. "/ruby/solargraph/solargraph",
            "stdio",
          },
          filetypes = { "ruby" },
          init_options = {
            formatting = true,
          },
          root_dir = function(fname)
            local util = require("lspconfig").util
            return util.root_pattern("Gemfile", ".git")(fname)
          end,
          settings = {
            solargraph = {
              diagnostics = true,
            },
          },
        },
      },
    },
    rust = {
      formatters = {
        -- {
        --   exe = "rustfmt",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "rust_analyzer",
        setup = {
          cmd = {
            ls_install_prefix .. "/rust/rust-analyzer",
          },
        },
      },
    },
    sh = {
      formatters = {
        -- {
        --   exe = "shfmt",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "bashls",
        setup = {
          cmd = {
            ls_install_prefix .. "/bash/node_modules/.bin/bash-language-server",
            "start",
          },
        },
      },
    },
    tailwindcss = {
      lsp = {
        active = false,
        provider = "tailwindcss",
        setup = {
          cmd = {
            ls_install_prefix .. "/tailwindcss/node_modules/.bin/tailwindcss-language-server",
            "--stdio",
          },
        },
      },
    },
    terraform = {
      formatters = {
        -- {
        --   exe = "terraform_fmt",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "terraformls",
        setup = {
          cmd = {
            ls_install_prefix .. "/terraform/terraform-ls",
            "serve",
          },
        },
      },
    },
    typescript = {
      formatters = {
        {
          exe = "prettier",
          args = {},
        },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
        -- {
        --   exe = "prettier_d_slim",
        --   args = {},
        -- },
      },
      linters = {
        {
          exe = "eslint_d",
        },
      },
      lsp = {
        provider = "tsserver",
        setup = {
          cmd = {
            -- TODO:
            ls_install_prefix .. "/typescript/node_modules/.bin/typescript-language-server",
            "--stdio",
          },
        },
      },
    },
    typescriptreact = {
      formatters = {
        {
          exe = "prettier",
          args = {},
        },
        --   exe = "prettierd",
        --   args = {},
        -- },
        -- {
        --   exe = "prettier_d_slim",
        --   args = {},
        -- },
      },
      -- @usage can be {"eslint"} or {"eslint_d"}
      linters = {
        {
          exe = "eslint_d",
        },
      },
      lsp = {
        provider = "tsserver",
        setup = {
          cmd = {
            -- TODO:
            ls_install_prefix .. "/typescript/node_modules/.bin/typescript-language-server",
            "--stdio",
          },
        },
      },
    },
    yaml = {
      formatters = {
        -- {
        --   exe = "prettier",
        --   args = {},
        -- },
        -- {
        --   exe = "prettierd",
        --   args = {},
        -- },
      },
      linters = {},
      lsp = {
        provider = "yamlls",
        setup = {
          cmd = {
            ls_install_prefix .. "/yaml/node_modules/.bin/yaml-language-server",
            "--stdio",
          },
        },
      },
    },
  },
}
