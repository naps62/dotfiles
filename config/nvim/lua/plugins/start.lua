return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local config = require("alpha.themes.startify").config
			require("alpha").setup(config)
		end,
	},
}
