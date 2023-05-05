return {
	"nanotee/sqls.nvim",

	{
		"kevinhwang91/nvim-hlslens",
		lazy = false,
		init = function()
			require("hlslens").setup()
		end,
		keys = {
			{
				"n",
				"<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>",
				noremap = true,
				silent = true,
			},
			{
				"N",
				"<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>",
				noremap = true,
				silent = true,
			},
			{ "*", "*<cmd>lua require('hlslens').start()<cr>", noremap = true, silent = true },
			{ "*", "*<cmd>lua require('hlslens').start()<cr>", noremap = true, silent = true },
			{ "g*", "g*<cmd>lua require('hlslens').start()<cr>", noremap = true, silent = true },
			{ "g#", "g#<cmd>lua require('hlslens').start()<cr>", noremap = true, silent = true },
		},
	},

	{
		"phaazon/hop.nvim",
		branch = "v2",
		init = function()
			require("hop").setup()
		end,
		keys = {
			{ "ff", "<cmd>HopChar1<cr>", desc = "go to char" },
			{ "2ff", "<cmd>HopChar2<cr>", desc = "go to bigram" },
			{ "<leader>fl", "<cmd>HopLineStart<cr>" },
			{ "<leader>fp", "<cmd>HopPattern<cr>" },
			{ "<leader>fw", "<cmd>HopWord<cr>" },
		},
	},

	{
		"windwp/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
        -- stylua: ignore
        keys = {
            { "<leader>S", function() require("spectre").open() end, desc = "Replace in files (Spectre)", },
        },
	},

	-- git conflicts
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},

	-- auto align tables
	"junegunn/vim-easy-align",

	-- debugging
	{ "mfussenegger/nvim-dap", dependencies = { "nvim-lua/plenary.nvim" } },

	-- folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		init = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype)
					return { "treesitter", "indent" }
				end,
			})

			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = -1
			vim.o.foldenable = true
			vim.o.foldcolumn = "auto"
		end,
		keys = {
			{
				"zR",
				function()
					return require("ufo").openAllFolds()
				end,
				"open all folds",
			},
			{
				"zM",
				function()
					return require("ufo").closeAllFolds()
				end,
				"close all folds",
			},
		},
	},

	-- auto pairs
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- surround
	{
		"echasnovski/mini.surround",
		config = function(_, opts)
			require("mini.surround").setup(opts)
		end,
	},

	-- commenting
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},

	-- todo comments
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		opts = {
			signs = true,
			pattern = [[\b(KEYWORDS)\b]],
		},
		config = function(_, opts)
			require("todo-comments").setup(opts)
		end,
	},
}
