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
				"vimdoc",
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
				lsp_interop = {
					enable = true,
					peek_definition_code = {
						["df"] = "@function.outer",
						["dc"] = "@class.outer",
					},
				},
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@function.outer",
						["ic"] = "@function.inner",
						["ae"] = "@block.outer",
						["ie"] = "@block.inner",
						["as"] = "@statement.outer",
						["is"] = "@statement.inner",
						["am"] = "@call.outer",
						["im"] = "@call.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
					},
				},
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
	{ "kaarmu/typst.vim" },
	{ "fladson/vim-kitty" },
}
