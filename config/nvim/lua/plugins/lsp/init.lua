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

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			--"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
			{ "williamboman/mason.nvim", build = ":MasonUpdate" },
			"SmiteshP/nvim-navic",
			"jose-elias-alvarez/typescript.nvim",
			"jose-elias-alvarez/null-ls.nvim",

			{
				"SmiteshP/nvim-navbuddy",
				opts = { lsp = { auto_attach = true } },

				dependencies = {
					{ "SmiteshP/nvim-navic", opts = { lsp = { auto_attach = true } } },
					"MunifTanjim/nui.nvim",
				},
			},
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp = require("lsp-zero")

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
				require("plugins.lsp.keymaps").on_attach(client, bufnr)

				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, bufnr)
				end
			end)

			lsp.set_server_config({
				capabilities = {
					textDocument = {
						foldingRange = {
							dynamicRegistration = false,
							lineFoldingOnly = true,
						},
					},
				},
			})

			lsp.format_on_save({
				format_opts = {
					async = false,
					timeout_ms = 10000,
				},
				servers = {
					["null-ls"] = { "javascript", "typescript", "lua", "typescriptreact", "solidity" },
				},
			})

			lsp.configure("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							allFeatures = true,
							command = "clippy",
							extraArgs = { "--all", "--", "-W", "clippy::all" },
						},
					},
				},
				flags = {
					debounce_text_changes = 150,
				},
			})

			lsp.skip_server_setup({ "tsserver" })

			vim.cmd([[autocmd BufWritePre *.rs lua vim.lsp.buf.format()]])

			-- (Optional) Configure lua language server for neovim
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

			lsp.setup()

			--
			-- rust
			--
			-- local rust_tools = require("rust-tools")
			-- rust_tools.setup({
			-- 	server = {
			-- 		on_attach = function(client, buffer)
			-- 			-- keymaps
			-- 			require("plugins.lsp.keymaps").on_attach(client, buffer)
			--
			-- 			-- navic
			-- 			if client.server_capabilities.documentSymbolProvider then
			-- 				require("nvim-navic").attach(client, buffer)
			-- 			end
			-- 		end,
			-- 		settings = {
			-- 			["rust-analyzer"] = {
			-- 				enable = true,
			-- 				imports = {
			-- 					granularity = {
			-- 						enforce = true,
			-- 						group = "module",
			-- 					},
			-- 					prefix = "self",
			-- 				},
			-- 				cargo = {
			-- 					allFeatures = true,
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- })

			--
			-- typescript
			--
			require("typescript").setup({
				server = {
					on_attach = function(client, buffer)
						client.server_capabilities.documentFormattingProvider = false
						-- keymaps
						require("plugins.lsp.keymaps").on_attach(client, buffer)

						-- navic
						if client.server_capabilities.documentSymbolProvider then
							require("nvim-navic").attach(client, buffer)
						end

						-- You can find more commands in the documentation:
						-- https://github.com/jose-elias-alvarez/typescript.nvim#commands
						vim.keymap.set("n", "<leader>ci", "<cmd>TypescriptAddMissingImports<cr>", { buffer = buffer })
					end,
				},
			})

			--
			-- null-ls
			--
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.forge_fmt,
					require("typescript.extensions.null-ls.code-actions"),
				},
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
}
