return {
	{
		"jackMort/ChatGPT.nvim",
		init = function()
			require("chatgpt").setup({})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	{
		"naps62/pair-gpt.nvim",
		opts = {
			bin = "~/projects/pair-gpt.nvim/target/release/pair-gpt",
			model = "gpt-4",
		},
	},
}
