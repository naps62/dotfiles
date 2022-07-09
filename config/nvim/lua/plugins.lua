local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
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
  use 'sainnhe/sonokai'

  -- syntax highlight
  use 'nvim-treesitter/nvim-treesitter'
  use 'tomlion/vim-solidity'
  use 'vmchale/just-vim'

  -- fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use 'ahmedkhalf/project.nvim'

  -- editing support
  use 'windwp/nvim-autopairs'
  use 'sbdchd/neoformat'
  use 'nanotee/sqls.nvim'

  -- LSP
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'simrat39/rust-tools.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-path'
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use 'nvim-lua/lsp-status.nvim'

  -- Debugging
  use { 'mfussenegger/nvim-dap', requires = { 'nvim-lua/plenary.nvim' } }

  -- search highlights
  use 'kevinhwang91/nvim-hlslens'

  -- motions
  use { 'phaazon/hop.nvim', branch = 'v1' }

  -- find/replace
  use {
    'windwp/nvim-spectre',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- integrated terminal
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
