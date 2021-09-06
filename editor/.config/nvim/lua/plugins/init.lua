vim.cmd [[packadd packer.nvim]]

-- packer.nvim configuration and plugins
require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor', {
        'nvim-treesitter/completion-treesitter',
        run = function()
          vim.cmd [[TSUpdate]]
        end
      }
    },
    config = function()
      require('plugins.treesitter')
    end
  }

  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp')
    end
  }

  use 'kabouzeid/nvim-lspinstall'

  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugins.completion').cmp_setup()
    end
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lua'

  use {'nvim-lua/lsp-status.nvim', commit = '745ba61c353b47c365d4dbfdd3d3334a3177f8cd'}

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = function()
      require('plugins.galaxyline')
    end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function()
      require('plugins.telescope')
    end
  }

  -- use 'sainnhe/gruvbox-material'
  use 'sainnhe/everforest'

  use {
    'glepnir/lspsaga.nvim',
    config = function()
      require('plugins.saga')
    end
  }

  use {'nvim-lua/lsp_extensions.nvim', commit = 'a1f12b8df1d3d8e46a7010615d2a335cd06814f2'}

  use {
    'mhartington/formatter.nvim',
    config = function()
      require('plugins.formatter')
    end
  }

  use {
    'b3nj5m1n/kommentary',
    config = function()
      require('plugins.kommentary')
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      vim.g.nvim_tree_disable_netrw = 0
    end
  }

  use 'mfussenegger/nvim-dap'

  use 'mfussenegger/nvim-jdtls'

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup(require('plugins.which-key').settings)
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup(require('plugins.gsigns').setup())
    end
  }
end)
