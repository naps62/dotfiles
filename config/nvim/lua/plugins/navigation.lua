return {
	{
		"ThePrimeagen/harpoon",
		requires = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>a",
				function()
					require("harpoon.mark").add_file()
				end,
				desc = "Create harpoon mark",
			},
			{
				"<leader>h",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "Harpoon quickfix toggle",
			},
			{
				"<leader>o",
				function()
					require("harpoon.ui").nav_next()
				end,
				desc = "Navigate to next harpoon mark",
			},
			{
				"<leader>i",
				function()
					require("harpoon.ui").nav_prev()
				end,
				desc = "Navigate to prev harpoon mark",
			},
		},
	},
}
