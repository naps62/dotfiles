return {
	{
		"airblade/vim-rooter",
		init = function()
			vim.g.rooter_patterns = { ".git", "Cargo.toml", "foundry.toml" }
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			close_if_last_window = true,
			window = {
				width = 30,
			},
		},
		keys = {
			{
				"<C-n>",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = require("util").get_root() })
				end,
				desc = "Neotree",
			},
			{ "<C-m>", "<cmd>Neotree reveal<cr>", desc = "Neotree reveal" },
		},
	},
}
