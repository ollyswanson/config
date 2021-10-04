vim.cmd([[packadd packer.nvim]])

-- packer.nvim configuration and plugins
require("packer").startup(function()
  -- Packer can manage itself as an optional plugin
  use({ "wbthomason/packer.nvim", opt = true })

  use("neovim/nvim-lspconfig")
  use({ "tamago324/nlsp-settings.nvim" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({ "antoinemadec/FixCursorHold.nvim" }) -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open

  use({
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").load("nordfox")
    end,
  })

  use("tpope/vim-surround")
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")

  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-refactor",
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
    "kabouzeid/nvim-lspinstall",
    config = function()
      require("core.lspinstall").setup()
    end,
  })

  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("core.luasnip.config").setup()
    end,
  })
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("core.completion").cmp_setup()
    end,
  })
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lua")
  use({ "saadparwaiz1/cmp_luasnip" })

  use({ "nvim-lua/lsp-status.nvim" })

  use({
    "shadmansaleh/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("lualine").setup(require("core.lualine").setup())
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
    "mhartington/formatter.nvim",
    config = function()
      require("core.formatter")
    end,
  })

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
      vim.g.nvim_tree_disable_netrw = 0
    end,
  })

  use("mfussenegger/nvim-dap")

  use("mfussenegger/nvim-jdtls")

  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup(require("core.which-key").settings)
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
end)
