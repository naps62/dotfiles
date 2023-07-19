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
			"simrat39/rust-tools.nvim",

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
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					-- Create your keybindings here...
				end,
			})

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- Replace these with whatever servers you want to install
					"rust_analyzer",
					"tsserver",
					"lua_ls",
				},
			})

			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					if lspconfig[server_name].on_attach then
						lspconfig[server_name].on_attach(function(client, bufnr)
							require("plugins.lsp.keymaps").on_attach(client, bufnr)
							if client.server_capabilities.documentSymbolProvider then
								require("nvim-navic").attach(client, bufnr)
							end

							if client.supports_method("textDocument/formatting") then
								vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
								vim.api.nvim_create_autocmd("BufWritePre", {
									group = augroup,
									buffer = bufnr,
									callback = function()
										vim.lsp.buf.format()
									end,
								})
							end
						end)
						lspconfig[server_name].setup({
							capabilities = lsp_capabilities,
						})
					end
				end,
			})

			--
			-- rust
			--
			local rust_tools = require("rust-tools")
			local rust_augroup = vim.api.nvim_create_augroup("RustToolsFormatting", {})
			rust_tools.setup({
				server = {
					on_attach = function(client, buffer)
						-- keymaps
						require("plugins.lsp.keymaps").on_attach(client, buffer)

						-- navic
						if client.server_capabilities.documentSymbolProvider then
							require("nvim-navic").attach(client, buffer)
						end

						if client.supports_method("textDocument/formatting") then
							vim.api.nvim_clear_autocmds({ group = rust_augroup, buffer = buffer })
							vim.api.nvim_create_autocmd("BufWritePre", {
								group = augroup,
								buffer = bufnr,
								callback = function()
									vim.lsp.buf.format()
								end,
							})
						end
					end,
					settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								allFeatures = true,
								command = "clippy",
								extraArgs = { "--all", "--", "-W", "clippy::all" },
							},
							enable = true,
							imports = {
								granularity = {
									enforce = true,
									group = "module",
								},
								prefix = "self",
							},
							cargo = {
								allFeatures = true,
							},
						},
					},
				},
			})

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
		end,
	},

	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim", "jose-elias-alvarez/typescript.nvim" },
		opts = function()
			local null_ls = require("null-ls")
			return {
				sources = {
					null_ls.builtins.formatting.taplo,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.solhint,
					null_ls.builtins.formatting.forge_fmt,
					require("typescript.extensions.null-ls.code-actions"),
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			}
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
