local function keymaps()
	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
			vim.keymap.set("n", "gv", function()
				require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" })
			end, opts)

			-- code actions
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set({ "n", "v" }, "ga", function()
				vim.lsp.buf.code_action({
					context = {
						only = {
							"",
							"quickfix",
							"refactor",
							"refactor.extract",
							"refactor.inline",
							"refactor.rewrite",
							"source",
							"source.organizeImports",
						},
					},
				})
			end, { buffer = ev.buf, desc = "Code Actions2" })

			-- diagnostics
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			vim.keymap.set("n", "<C-S-K>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

			vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
			vim.keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<cr>", opts)
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts)
		end,
	})
end

local function generic_lsp(server_name, lspconfig, lsp_capabilities, augroup)
	lspconfig[server_name].setup({
		capabilities = lsp_capabilities,
		-- if lspconfig[server_name].on_attach then
		on_attach = function(client, bufnr)
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
		end,
	})
	-- end
end

local function rust_analyzer(augroup)
	require("rust-tools").setup({
		server = {
			on_attach = function(client, buffer)
				require("nvim-navic").attach(client, buffer)

				vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = buffer,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
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
end

local function tsserver()
	require("typescript-tools").setup({
		code_lens = "on",
		expose_as_code_action = {
			"fix_all",
			"add_missing_imports",
			-- "remove_unused",
			-- "remove_unused_imports",
			"organize_imports",
		},
		server = {
			on_attach = function(client, buffer)
				client.server_capabilities.documentFormattingProvider = false
				require("nvim-navic").attach(client, buffer)
				-- You can find more commands in the documentation:
				-- https://github.com/jose-elias-alvarez/typescript.nvim#commands
				vim.keymap.set("n", "<leader>ci", "<cmd>TypescriptAddMissingImports<cr>", { buffer = buffer })
			end,
		},
	})
end

local function lua_ls()
	require("lspconfig").lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim", "augroup" },
				},
			},
		},
	})
end

local M = {
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
		lazy = false,
		dependencies = {
			--"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
			{ "williamboman/mason.nvim", build = ":MasonUpdate" },
			"SmiteshP/nvim-navic",
			"jose-elias-alvarez/typescript.nvim",
			"pmizio/typescript-tools.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"simrat39/rust-tools.nvim",
			"pmizio/typescript-tools.nvim",
		},

		config = function()
			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			local mason_lspconfig = require("mason-lspconfig")

			require("mason").setup()
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"eslint",
					"rust_analyzer",
					"tsserver",
				},
			})

			require("lspconfig").gdscript.setup({})
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			mason_lspconfig.setup_handlers({
				function(server_name)
					generic_lsp(server_name, lspconfig, lsp_capabilities, augroup)
				end,

				["lua_ls"] = function()
					lua_ls()
				end,

				["rust_analyzer"] = function()
					rust_analyzer(augroup)
				end,

				["tsserver"] = function()
					tsserver()
				end,
			})

			keymaps()
		end,
	},
}

return M
