return {
	{
		"stevearc/oil.nvim",
		opts = {
			keymaps = { ["<C-p>"] = false },
		},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		keys = {
			{
				"<C-n>",
				function()
					require("oil").open()
				end,
				desc = "Open file explorer",
			},
			{
				"<C-m>",
				function()
					local root = vim.system({ "git", "rev-parse", "--show-toplevel" }, { text = true }):wait()
					print(root.stdout)
					print("asd")
					require("oil").open(vim.trim(root.stdout))
				end,
				desc = "Open parent directory",
			},
		},
	},
}
