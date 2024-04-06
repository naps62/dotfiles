return {
	-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/guides/lazy-loading-with-lazy-nvim.md
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		lazy = true,
		config = function()
			-- This is where you modify the settings for lsp-zero
			-- Note: autocompletion settings will not take effect
			require("lsp-zero.settings").preset({})
		end,
	},

	{
		"mhartington/formatter.nvim",
		lazy = false,
		config = function()
			local util = require("formatter.util")
			local defaults = require("formatter.defaults")

			require("formatter").setup({
				filetype = {
					lua = { require("formatter.filetypes.lua").stylua },
					toml = { require("formatter.filetypes.toml").taplo },
					typescript = { defaults.prettierd },
					-- typescriptreact = { defaults.eslint_d, defaults.prettierd },
					json = { defaults.prettierd },
					css = { defaults.prettierd },
					markdown = { defaults.prettierd },
					solidity = {
						function()
							return {
								exe = "forge",
								args = { "fmt", "--raw", "-" },
								stdin = true,
							}
						end,
					},
				},
			})

			local augroup = vim.api.nvim_create_augroup
			local autocmd = vim.api.nvim_create_autocmd
			augroup("__formatter__", { clear = true })
			autocmd("BufWritePost", {
				group = "__formatter__",
				command = ":FormatWrite",
			})
		end,
	},

	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
		},
	},

	{
		"hedyhli/outline.nvim",
		config = function()
			local outline = require("outline")

			outline.setup({
				outline_window = {
					width = 10,
				},
				preview_window = {
					open_hover_on_preview = true,
				},
				keymaps = {
					goto_location = "<CR>",
					goto_and_close = "<S-CR>",
					down_and_jump = "j",
					up_and_jump = "k",
				},
			})
		end,
		keys = { {
			"<leader>o",
			"<cmd>Outline<CR>",
			desc = "Toggle symbol outline",
		} },
	},
}
