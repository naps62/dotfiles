return {

	{
		"navarasu/onedark.nvim",
		lazy = false,
		init = function()
			require("onedark").setup({ style = "darker" })
			vim.cmd([[
      if has('termguicolors')
        set termguicolors
      endif

      set background=dark
      colorscheme onedark
      highlight SpecialComment gui=bold
    ]])
		end,
	},

	"lewis6991/gitsigns.nvim",
}
