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
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require("nvim-tree").setup({
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enabled = true,
          update_cwd = true
        }
      })
    end
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
  use { 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "rust",
          "lua",
          "javascript",
          "typescript",
          "tsx",
          "solidity",
          "graphql",
          "toml",
          "ruby",
          "bash",
          "python",
          "css",
          "markdown",
          "json"
        },
        highlight = {
          enabled = true
        },
        indentation = { enabled = true }
      })

    end }
  use 'tomlion/vim-solidity'
  use 'vmchale/just-vim'

  -- fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup()
      require("telescope").load_extension("projects")
    end
  }
  use { 'ahmedkhalf/project.nvim', config = function() require 'project_nvim'.setup() end }

  -- editing support
  use { 'windwp/nvim-autopairs', config = function() require 'nvim-autopairs'.setup() end }
  use 'sbdchd/neoformat'
  use 'nanotee/sqls.nvim'

  -- LSP
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use { 'glepnir/lspsaga.nvim', config = function() require 'lspsaga'.init_lsp_saga() end }
  use { 'simrat39/rust-tools.nvim', config = function()
    -- taken from
    -- https://sharksforarms.dev/posts/neovim-rust/
    require('rust-tools').setup({
      tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
          show_parameter_hints = false,
          parameter_hints_prefix = "",
          other_hints_prefix = ""
        }
      },

      -- all the opts to send to nvim-lspconfig
      -- these override the defaults set by rust-tools.nvim
      -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
      server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
          -- to enable rust-analyzer settings visit:
          -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
          ["rust-analyzer"] = {
            -- enable clippy on save
            checkOnSave = {
              command = "clippy"
            },
          }
        }
      },
    })
  end }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-path'
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use 'nvim-lua/lsp-status.nvim'
  use { 'onsails/lspkind.nvim', config = function() require 'lspkind'.init() end }

  -- copilot
  use { 'zbirenbaum/copilot.lua',
    event = { 'VimEnter' },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end }
  use { 'zbirenbaum/copilot-cmp', module = 'copilot_cmp' }

  -- Debugging
  use { 'mfussenegger/nvim-dap', requires = { 'nvim-lua/plenary.nvim' } }

  -- search highlights
  use 'kevinhwang91/nvim-hlslens'

  -- motions
  use { 'phaazon/hop.nvim', branch = 'v1', config = function() require 'hop'.setup() end }

  -- find/replace
  use {
    'windwp/nvim-spectre',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- integrated terminal
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*', config = function()
    require('toggleterm').setup({
      size = 50,
      open_mapping = [[<c-\>]],
      direction = 'vertical'
    })
  end }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
