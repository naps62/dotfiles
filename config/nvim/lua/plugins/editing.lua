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
		-- keys = {
		-- 	{
		-- 		"la",
		-- 		"<Plug>(EasyAlign)",
		-- 		desc = "Start interactive EasyAlign",
		-- 		mode = { "n", "v" },
		-- 	},
		-- },
	},

	-- folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		init = function()
			require("ufo").setup()

			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
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
		event = "VeryLazy",
		config = function(_, opts)
			require("Comment").setup(opts)
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
