return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			close_if_last_window = true,
			auto_clean_after_session_restore = true,
			window = {
				width = 30,
			},
			filesystem = {
				filtered_items = {
					always_show = {
						".github",
						".gitignore",
						".cargo",
						".github",
					},
				},
			},
		},
		keys = {
			{
				"<C-n>",
				function()
					require("neo-tree.command").execute({ toggle = true, position = "right" })
				end,
				desc = "Neotree",
			},
			{ "<C-m>", "<cmd>Neotree reveal right<cr>", desc = "Neotree reveal" },
		},
	},
}
