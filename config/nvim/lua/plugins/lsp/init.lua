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
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
			{ "williamboman/mason.nvim", build = ":MasonUpdate" },
			"SmiteshP/nvim-navic",
			"simrat39/rust-tools.nvim",
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

				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, bufnr)
				end
			end)

			lsp.format_on_save({
				format_opts = {
					async = false,
					timeout_ms = 10000,
				},
				servers = {
					["null-ls"] = { "javascript", "typescript", "lua", "typescriptreact" },
				},
			})

			lsp.skip_server_setup({ "rust_analyzer", "tsserver" })

			-- (Optional) Configure lua language server for neovim
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

			lsp.setup()

			--
			-- rust
			--
			local rust_tools = require("rust-tools")
			rust_tools.setup({
				server = {
					on_attach = function(client, buffer)
						-- keymaps
						require("plugins.lsp.keymaps").on_attach(client, buffer)

						-- navic
						if client.server_capabilities.documentSymbolProvider then
							require("nvim-navic").attach(client, buffer)
						end
					end,
					flags = {
						debounce_text_changes = 150,
					},
					settings = {
						["rust-analyzer"] = {
							enable = true,
							imports = {
								granularity = {
									enforce = true,
									group = "module",
								},
								prefix = "self",
							},
							checkOnSave = {
								allFeatures = true,
								command = "clippy",
								extraArgs = { "--all", "--", "-W", "clippy::all" },
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

			--
			-- null-ls
			--
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.stylua,
					require("typescript.extensions.null-ls.code-actions"),
				},
			})
		end,
	},

	-- {
	--   "neovim/nvim-lspconfig",
	--   event = "BufReadPre",
	--   dependencies = {
	--     { "folke/neoconf.nvim", cmd = "Neoconf",                                config = true },
	--     { "folke/neodev.nvim",  opts = { experimental = { pathStrict = true } } },
	--     "mason.nvim",
	--     "williamboman/mason-lspconfig.nvim",
	--     {
	--       "hrsh7th/nvim-cmp",
	--       cond = function()
	--         -- TODO not sure what this is for?
	--         return require("util").has("nvim-cmp")
	--       end,
	--     },
	--   },
	--
	--   ---@class PluginLspOpts
	--   opts = {
	--     -- options for vim.diagnostic.config()
	--     diagnostics = {
	--       underline = true,
	--       update_in_insert = false,
	--       virtual_text = { spacing = 2, prefix = "●" },
	--       severity_sort = true,
	--     },
	--     autoformat = false,
	--     -- options for vim.lsp.buf.format
	--     -- `bufnr` and `filter` is handled by the LazyVim formatter,
	--     -- but can be also overriden when specified
	--     format = {
	--       formatting_options = nil,
	--       timeout_ms = nil,
	--     },
	--     -- LSP Server Settings
	--     ---@type lspconfig.options
	--     servers = {
	--       jsonls = {},
	--       sqls = {},
	--       tsserver = {
	--         on_attach = function(client)
	--           client.resolved_capabilities.document_formatting = false
	--         end,
	--       },
	--       tailwindcss = {},
	--       solidity = {
	--         settings = {
	--           solidity = {},
	--         },
	--       },
	--       lua_ls = {
	--         settings = {
	--           Lua = {
	--             workspace = {
	--               checkThirdParty = false,
	--             },
	--             completion = {
	--               callSnippet = "Replace",
	--             },
	--           },
	--         },
	--       },
	--       rust_analyzer = {
	--         settings = {
	--           ["rust-analyzer"] = {
	--             checkOnSave = {
	--               allFeatures = true,
	--               command = "clippy",
	--               extraArgs = { "--all", "--", "-W", "clippy::all", "-W", "clippy::dbg_macro" },
	--             },
	--           },
	--         },
	--       },
	--     },
	--     -- you can do any additional lsp server setup here
	--     -- return true if you don't want this server to be setup with lspconfig
	--     ---@type table<string, fun(server:string, opts:lspconfig.options):boolean?>
	--     setup = {
	--       -- example to setup with typescript.nvim
	--       -- tsserver = function(_, opts)
	--       --   require("typescript").setup({ server = opts })
	--       --   return true
	--       -- end,
	--       -- Specify * to use this function as a fallback for any server
	--       -- ["*"] = function(server, opts) end,
	--     },
	--   },
	--   ---@param opts PluginLspOpts
	--   config = function(plugin, opts)
	--     -- setup autoformat
	--     require("plugins.lsp.format").autoformat = opts.autoformat
	--     -- setup formatting and keymaps
	--     require("util").on_attach(function(client, buffer)
	--       require("plugins.lsp.format").on_attach(client, buffer)
	--       require("plugins.lsp.keymaps").on_attach(client, buffer)
	--       require("lsp-status").on_attach(client)
	--     end)
	--
	--     -- diagnostics
	--     for name, icon in pairs(require("config.icons").diagnostics) do
	--       name = "DiagnosticSign" .. name
	--       vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
	--     end
	--     vim.diagnostic.config(opts.diagnostics)
	--
	--     local servers = opts.servers
	--     local capabilities =
	--         require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	--
	--     local function setup(server)
	--       local server_opts = server[server] or {}
	--       server_opts.capabilities = capabilities
	--       if opts.setup[server] then
	--         if opts.setup[server](server, server_opts) then
	--           return
	--         end
	--       elseif opts.setup[""] then
	--         if opts.setup["*"](server, server_opts) then
	--           return
	--         end
	--       end
	--       require("lspconfig")[server].setup(server_opts)
	--     end
	--
	--     local mlsp = require("mason-lspconfig")
	--     local available = mlsp.get_available_servers()
	--
	--     local ensure_installed = {} ---@type string[]
	--     for server, server_opts in pairs(servers) do
	--       if server_opts then
	--         server_opts = server_opts == true and {} or server_opts
	--         -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
	--         if server_opts.mason == false or not vim.tbl_contains(available, server) then
	--           setup(server)
	--         else
	--           ensure_installed[#ensure_installed + 1] = server
	--         end
	--       end
	--     end
	--
	--     require("mason-lspconfig").setup({ ensure_installed })
	--     require("mason-lspconfig").setup_handlers({ setup })
	--   end,
	-- },

	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
		},
	},

	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.prettierd,
					nls.builtins.formatting.stylua,
				},
			}
		end,
	},
}
