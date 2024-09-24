return {
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- Optional
			{
				"stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
				opts = {},
			},
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = { adapter = "anthropic" },
					inline = { adapter = "anthropic" },
					agent = { adapter = "anthropic" },
				},
				adapters = {
					anthropic = function()
						return require("codecompanion.adapters").extend("anthropic", {
							env = {
								api_key = os.getenv("ANTHROPIC_API_KEY"),
							},
						})
					end,
				},
			})
		end,
	},

	-- {
	-- 	"milanglacier/minuet-ai.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("minuet").setup({ provider = "gemini" })
	-- 	end,
	-- },
	--
	--
	--
}
