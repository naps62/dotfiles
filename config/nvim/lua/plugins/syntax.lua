return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = "BufReadPost",
		init = function()
			vim.api.nvim_exec(
				[[
      " augroup treesitter-highlight
      " autocmd!
      " autocmd BufEnter *.graphql,*.gql,*.elixir,*.md TSBufEnable highlight
      " augroup END

      augroup custom-syntax
      autocmd!
      autocmd BufEnter *.cairo set syntax=cairo
      autocmd Syntax *.sol syntax match solNatspecTag "\v\@\w+" containedin=solComment,solLineComment
      autocmd Syntax *.sol syntax match solNatspecRef "\v\{\w+\}" containedin=solComment,solLineComment
      autocmd Syntax *.sol highlight! link solNatspecTag solKeyword
      autocmd Syntax *.sol highlight! link solNatspecRef solFuncName
      augroup END
      ]],
				false
			)
		end,
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"rust",
				"lua",
				"regex",
				"help",
				"html",
				"javascript",
				"typescript",
				"tsx",
				"solidity",
				"toml",
				"bash",
				"css",
				"markdown",
				"markdown_inline",
				"json",
				"elixir",
				"erlang",
				"eex",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_icnremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	"tomlion/vim-solidity",
	"vmchale/just-vim",
	"elkowar/yuck.vim",
	-- {
	-- 	"mhanberg/elixir.nvim",
	-- 	config = function()
	-- 		require("elixir").setup()
	-- 	end,
	-- },
}
