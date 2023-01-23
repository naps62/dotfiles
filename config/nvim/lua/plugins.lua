local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

return require('packer').startup(function(use)
  use 'jbyuki/instant.nvim'

  use { 'naps62/pair-gpt.nvim', config = function()
    require('pair-gpt').setup {
      bin = "~/projects/pair-gpt.nvim/target/debug/pair-gpt"
    }
  end }

  use 'wbthomason/packer.nvim'

  -- file explorer
  use 'airblade/vim-rooter'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require("nvim-tree").setup {
        respect_buf_cwd = true,
        sync_root_with_cwd = false,
        update_focused_file = {
          enable = true,
          update_cwd = true
        },
        renderer = {
          icons = {
            git_placement = "signcolumn",
          }
        }
      }
    end
  }

  -- theme
  use { 'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup({
        style = 'darker',
      })
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- syntax highlight
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
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
          "json",
          "elixir",
          "proto"
        },
        highlight = {
          enabled = true
        },
        indentation = { enabled = true }
      })

    end }
  -- use { 'nvim-treesitter/nvim-treesitter-context', config = function()
  --   require('treesitter-context').setup()
  -- end }
  use 'tomlion/vim-solidity'
  use 'vmchale/just-vim'
  use { 'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = function()
      require 'ufo'.setup({
        provider_selector = function(bufnr, filetype)
          return { 'treesitter', 'indent' }
        end
      })
    end }

  -- fuzzy finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ['<C-c>'] = actions.close
            }
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })
      require("telescope").load_extension("projects")
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end
  }
  use { 'ahmedkhalf/project.nvim', config = function() require 'project_nvim'.setup() end }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'junegunn/fzf', dir = '~/.fzf' }
  use 'junegunn/fzf.vim'

  -- editing support
  use { 'windwp/nvim-autopairs', config = function() require 'nvim-autopairs'.setup() end }
  use 'sbdchd/neoformat'
  use 'nanotee/sqls.nvim'
  use { 'terrortylor/nvim-comment', config = function() require 'nvim_comment'.setup() end }

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use { 'glepnir/lspsaga.nvim', branch = "main", config = function() require('lspsaga').setup({
      lightbulb = { enable = false }
    })
  end }

  use 'simrat39/rust-tools.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-path'
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use 'nvim-lua/lsp-status.nvim'
  use { 'onsails/lspkind.nvim', config = function() require 'lspkind'.init() end }
  use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'


  -- Debugging
  use { 'mfussenegger/nvim-dap', requires = { 'nvim-lua/plenary.nvim' } }

  -- search highlights
  use { 'kevinhwang91/nvim-hlslens', config = function() require('hlslens').setup() end }

  -- motions
  use { 'phaazon/hop.nvim', branch = 'v1', config = function() require 'hop'.setup() end }

  -- find/replace
  use {
    'windwp/nvim-spectre',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- integrated terminal
  use { 'christoomey/vim-tmux-navigator', config = function()
    vim.cmd [[
      let g:tmux_navigator_no_mappings = 1

      nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
      nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
      nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
      nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
    ]]
  end }
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*', config = function()
    require('toggleterm').setup({
      size = 50,
      open_mapping = [[<c-\>]],
      direction = 'vertical',
      autochdir = true,
    })
  end }

  -- wakatime
  use 'wakatime/vim-wakatime'

  -- Markdown
  -- auto align tables
  use 'junegunn/vim-easy-align'

  -- git conflicts
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = function()
    require('diffview').setup({})
  end }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use { '~/projects/pair-gpt.nvim', config = function()
    require('pair-gpt').setup {
      bin = "~/projects/pair-gpt.nvim/target/debug/pair-gpt"
    }
  end }

  -- copilot
  -- use 'github/copilot.vim'
  use { 'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = 'VimEnter',
    config = function()
      vim.defer_fn(function()
        require("copilot").setup(
          {
            suggestion = { enabled = false },
            panel = { enabled = false }
          }
        )
      end, 100)
    end }
  use { 'zbirenbaum/copilot-cmp',
    after = 'copilot.lua',
    config = function()
      require("copilot_cmp").setup()
    end }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
