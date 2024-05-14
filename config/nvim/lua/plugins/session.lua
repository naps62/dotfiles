return {
	{
		"rmagatti/auto-session",
		lazy = false,
		dependencies = { "nvim-lualine/lualine.nvim" },
		config = function()
			vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/downloads", "~/projects" },
				cwd_change_handling = {
					restore_upcoming_session = true,
					post_cwd_changed_hook = function()
						require("lualine").refresh()
					end,
					session_lens = {
						previewer = true,
					},
				},
				pre_save_cmd = { "NeoTreeClose" },
			})
		end,
		keys = {
			{ "<C-.>", "<cmd>Autosession search<cr>", desc = "Find sessions" },
		},
	},
}
