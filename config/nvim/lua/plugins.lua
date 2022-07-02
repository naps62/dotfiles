local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- use 'christoomey/vim-tmux-navigator'

  -- file explorer
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

  -- fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use 'cljoly/telescope-repo.nvim'

  -- search highlights
  use 'kevinhwang91/nvim-hlslens'

  -- motions
  use {
    'phaazon/hop.nvim',
    branch = 'v1',
    config = function() require'hop'.setup() end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
