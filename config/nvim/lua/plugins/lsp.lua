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
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "biome" },
				typescript = { "biome" },
				yaml = { "biome" },
				solidity = { "forge_fmt" },
			},
			format_on_save = function()
				local buf_path = vim.api.nvim_buf_get_name(0)
				if buf_path:find("/contrib/") then
					return nil
				end

				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end,
		},
	},

	-- {
	-- 	"mhartington/formatter.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		local defaults = require("formatter.defaults")
	--
	-- 		print(vim.fn.expand("%"))
	--
	-- 		require("formatter").setup({
	-- 			filetype = {
	-- 				toml = { require("formatter.filetypes.toml").taplo },
	-- 				yaml = { defaults.biome },
	-- 				typescriptreact = { defaults.biome, defaults.eslint_d },
	-- 				json = { defaults.biome },
	-- 				css = { defaults.prettierd },
	-- 				markdown = { defaults.prettierd },
	-- 			},
	-- 		})
	--
	-- 		local augroup = vim.api.nvim_create_augroup
	-- 		local autocmd = vim.api.nvim_create_autocmd
	-- 		augroup("__formatter__", { clear = true })
	-- 		autocmd("BufWritePost", {
	-- 			group = "__formatter__",
	-- 			command = ":FormatWrite",
	-- 		})
	-- 	end,
	-- },

	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = { use_diagnostic_signs = true },
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>xt",
				"<cmd>Trouble todo toggle<cr>",
				desc = "Todos (Trouble)",
			},
			{
				"<leader>o",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols Outline (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	-- {
	-- 	"hedyhli/outline.nvim",
	-- 	config = function()
	-- 		local outline = require("outline")
	--
	-- 		outline.setup({
	-- 			outline_window = {
	-- 				width = 10,
	-- 			},
	-- 			preview_window = {
	-- 				open_hover_on_preview = true,
	-- 			},
	-- 			keymaps = {
	-- 				goto_location = "<CR>",
	-- 				goto_and_close = "<S-CR>",
	-- 				down_and_jump = "j",
	-- 				up_and_jump = "k",
	-- 			},
	-- 		})
	-- 	end,
	-- 	keys = {
	-- 		{
	-- 			"<leader>o",
	-- 			function()
	-- 				vim.cmd.OutlineOpen()
	-- 				vim.cmd.OutlineFocusOutline()
	-- 			end,
	-- 			desc = "Toggle symbol outline",
	-- 		},
	-- 		{
	-- 			"<leader>O",
	-- 			vim.cmd.Outline,
	-- 			desc = "Toggle symbol outline",
	-- 		},
	-- 	},
	-- },
}
