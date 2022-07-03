local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- file explorer
  use 'airblade/vim-rooter'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- theme
  use 'folke/tokyonight.nvim'
  use 'NLKNguyen/papercolor-theme'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use 'petertriho/nvim-scrollbar'

  -- syntax highlight
  use 'nvim-treesitter/nvim-treesitter'
  use 'tomlion/vim-solidity'

  -- fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup()
    end
  }

  -- editing support
  use 'windwp/nvim-autopairs'
  use 'ms-jpq/coq_nvim'
  use 'ms-jpq/coq.artifacts'
  use 'sbdchd/neoformat'

  -- LSP
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'

  -- Debugging
  use {
    'mfussenegger/nvim-dap',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- search highlights
  use 'kevinhwang91/nvim-hlslens'

  -- motions
  use {
    'phaazon/hop.nvim',
    branch = 'v1',
    config = function() require'hop'.setup() end
  }

  -- find/replace
  use {
    'windwp/nvim-spectre',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- integrated terminal
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
