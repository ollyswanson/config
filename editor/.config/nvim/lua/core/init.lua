vim.cmd([[packadd packer.nvim]])

-- packer.nvim configuration and plugins
require("packer").startup(function()
  -- Packer can manage itself as an optional plugin
  use({ "wbthomason/packer.nvim", opt = true })

  use("neovim/nvim-lspconfig")
  use({ "williamboman/nvim-lsp-installer",

    config = function()
      require("nvim-lsp-installer").setup({
        ensure_installed = { "rust_analyzer", "sumneko_lua" },
        ui = {
          check_outdated_servers_on_open = true,
          icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
          }
        }
      })
    end
  })

  use({ "tamago324/nlsp-settings.nvim" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({ "antoinemadec/FixCursorHold.nvim" }) -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use { "stevearc/dressing.nvim" }

  use({
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd("colorscheme nordfox")
    end,
  })

  use("tpope/vim-surround")
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")

  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "windwp/nvim-ts-autotag",
      {
        "nvim-treesitter/completion-treesitter",
        run = function()
          vim.cmd([[TSUpdate]])
        end,
      },
    },
    config = function()
      require("core.treesitter")
    end,
  })

  use("nvim-treesitter/nvim-treesitter-textobjects")


  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("core.luasnip.config").setup()
    end,
  })
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      -- TODO: review necessary config
      require("core.completion").cmp_setup()
    end,
  })
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lua")
  use({ "saadparwaiz1/cmp_luasnip" })

  use({ "nvim-lua/lsp-status.nvim" })

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      local setup = require("core.lualine").setup
      ---@diagnostic disable-next-line: different-requires, redundant-parameter
      require("lualine").setup(setup())
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    config = function()
      require("core.telescope").setup()
    end,
  })

  use({ "nvim-lua/lsp_extensions.nvim" })

  use({
    "b3nj5m1n/kommentary",
    config = function()
      require("core.kommentary")
    end,
  })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("core.tree").setup()
    end,
  })

  use("mfussenegger/nvim-dap")

  use({
    "folke/which-key.nvim",
    config = function()
      ---@diagnostic disable-next-line: different-requires
      local settings = require("core.which-key").settings
      ---@diagnostic disable-next-line: different-requires, redundant-parameter
      require("which-key").setup(settings)
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup(require("core.gsigns").setup())
    end,
  })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({ buftype_exclude = { "terminal" }, show_end_of_line = true })
    end,
  })

  -- use {
  --   'TimUntersberger/neogit',
  --   requires = {'sindrets/diffview.nvim'},
  --   config = function()
  --     vim.defer_fn(function()
  --       require('neogit').setup {integrations = {diffview = true}}
  --     end, 10)
  --   end
  -- }
  use("sindrets/diffview.nvim")

  use({
    "simrat39/rust-tools.nvim",
    config = function()
      require("core.rust-tools").setup()
    end,
  })

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  }

  use("ellisonleao/glow.nvim")

  use {
    "p00f/clangd_extensions.nvim",
    config = function()
      require("core.clangd").setup()
    end
  }

  use {
    "nathom/filetype.nvim",
    config = require("core.filetype").setup
  }

end)
