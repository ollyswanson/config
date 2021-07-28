vim.cmd [[packadd packer.nvim]]

-- packer.nvim configuration and plugins
require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use 'tpope/vim-surround'

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

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp')
    end
  }

  use 'kabouzeid/nvim-lspinstall'

  use {
    'hrsh7th/nvim-compe',
    config = function()
      require('plugins.completion')
    end
  }

  use {'nvim-lua/lsp-status.nvim'}

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

  use 'nvim-lua/lsp_extensions.nvim'

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

  -- remove once treesitter has been updated
  --  use 'HerringtonDarkholme/yats.vim'
end)
