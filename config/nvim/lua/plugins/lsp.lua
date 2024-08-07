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
			local defaults = require("formatter.defaults")

			require("formatter").setup({
				filetype = {
					lua = { require("formatter.filetypes.lua").stylua },
					toml = { require("formatter.filetypes.toml").taplo },
					typescript = {
						defaults.eslint_d,
						defaults.biome,
					},
					yaml = { defaults.biome },
					typescriptreact = { defaults.biome, defaults.eslint_d },
					json = { defaults.biome },
					css = { defaults.prettierd },
					markdown = { defaults.prettierd },
					rust = {
						function()
							return { exe = "rustfmt", args = { "+nightly", "--edition 2021" }, stdin = true }
						end,
					},
					solidity = {
						function()
							return {
								exe = "/home/naps62/.config/.foundry/bin/forge",
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
		cmd = { "Trouble" },
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = { use_diagnostic_signs = true },
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle filter = { severity=vim.diagnostic.severity.ERROR }<cr>",
				desc = "Document Diagnostics (Trouble)",
			},
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
		keys = {
			{
				"<leader>o",
				function()
					vim.cmd.OutlineOpen()
					vim.cmd.OutlineFocusOutline()
				end,
				desc = "Toggle symbol outline",
			},
			{
				"<leader>O",
				vim.cmd.Outline,
				desc = "Toggle symbol outline",
			},
		},
	},
}
