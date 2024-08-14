return {
	{
		"kevinhwang91/nvim-hlslens",
		lazy = true,
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
		event = "VeryLazy",
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
		event = "VeryLazy",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			view = {
				merge_tool = {
					layout = "diff4_mixed",
				},
			},
		},
	},

	-- auto align tables
	{
		"junegunn/vim-easy-align",
		event = "VeryLazy",
	},

	-- folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
		event = "BufReadPost",
		config = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

			require("ufo").setup({
				provider_selector = function()
					return { "treesitter", "indent" }
				end,
			})
		end,
		keys = {
			{
				"zR",
				function()
					require("ufo").openAllFolds()
				end,
				"open all folds",
			},
			{
				"zM",
				function()
					require("ufo").closeAllFolds()
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
		even = "VeryLazy",
		config = function(_, opts)
			require("mini.surround").setup(opts)
		end,
	},

	-- commenting
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = "VeryLazy",
		config = function(_)
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	-- todo comments
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		opts = {
			signs = true,
			highlight = {
				pattern = [[.*<(KEYWORDS)\s*:?]],
			},
			search = {
				pattern = [[\b(KEYWORDS)\b]],
			},
		},
		config = function(_, opts)
			require("todo-comments").setup(opts)
		end,
	},

	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {
			restricted_keys = {
				["w"] = { "n", "x" },
				["W"] = { "n", "x" },
				["b"] = { "n", "x" },
				["B"] = { "n", "x" },
			},
		},
	},
}
