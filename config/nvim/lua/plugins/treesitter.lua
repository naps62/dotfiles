return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		lazy = false,
		build = ":TSUpdate",
		event = "BufReadPre",
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"rust",
				"lua",
				"regex",
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
				"kdl",
				"yuck",
				"sql",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = { enable = true },
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			vim.treesitter.language.register("markdown", "mdx")
			vim.treesitter.language.register("markdown", "octo")
			vim.api.nvim_exec2(
				[[
        highlight @inlinesql gui=italic
      ]],
				{}
			)
		end,
	},

	{ "tomlion/vim-solidity" },
	{ "vmchale/just-vim" },
	{ "kaarmu/typst.vim" },
	{ "fladson/vim-kitty" },
}
