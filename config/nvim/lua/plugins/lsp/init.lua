return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"hrsh7th/nvim-cmp",
				cond = function()
					-- TODO not sure what this is for?
					return require("util").has("nvim-cmp")
				end,
			},
		},

		---@class PluginLspOpts
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = { spacing = 2, prefix = "●" },
				severity_sort = true,
			},
			autoformat = true,
			-- options for vim.lsp.buf.format
			-- `bufnr` and `filter` is handled by the LazyVim formatter,
			-- but can be also overriden when specified
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			-- LSP Server Settings
			---@type lspconfig.options
			servers = {
				jsonls = {},
				sqls = {},
				tsserver = {},
				tailwindcss = {},
				solidity = {
					settings = {
						solidity = {},
					},
				},
				rust_analyzer = {},
				lua_ls = {
					-- mason = false, -- set to false if you don't want this server to be installed with mason
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			---@type table<string, fun(server:string, opts:lspconfig.options):boolean?>
			setup = {
				-- example to setup with typescript.nvim
				-- tsserver = function(_, opts)
				--   require("typescript").setup({ server = opts })
				--   return true
				-- end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
			},
		},
		---@param opts PluginLspOpts
		config = function(plugin, opts)
			-- setup autoformat
			require("plugins.lsp.format").autoformat = opts.autoformat
			-- setup formatting and keymaps
			require("util").on_attach(function(client, buffer)
				require("plugins.lsp.format").on_attach(client, buffer)
				require("plugins.lsp.keymaps").on_attach(client, buffer)
				require("lsp-status").on_attach(client)
			end)

			-- diagnostics
			for name, icon in pairs(require("config.icons").diagnostics) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end
			vim.diagnostic.config(opts.diagnostics)

			local servers = opts.servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local function setup(server)
				local server_opts = server[server] or {}
				server_opts.capabilities = capabilities
				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup[""] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			local mlsp = require("mason-lspconfig")
			local available = mlsp.get_available_servers()

			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(available, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			require("mason-lspconfig").setup({ ensure_installed })
			require("mason-lspconfig").setup_handlers({ setup })
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

	"williamboman/mason.nvim",
	{ "williamboman/mason-lspconfig.nvim" },

	-- cmdline tools and lsp servers
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {},
		},
		config = function(plugin, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},

	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			local rt = require("rust-tools")

			local opts = {
				tools = { -- rust-tools options
					executor = require("rust-tools/executors").termopen,
					runnables = {
						use_telescope = true,
					},
				},
				server = {
					standalone = true,
					on_attach = function(client, buffer)
						require("plugins.lsp.format").on_attach(client, buffer)
						require("plugins.lsp.keymaps").on_attach(client, buffer)
						require("lsp-status").on_attach(client)
					end,
					settings = {
						["rust-analyzer"] = {
							-- enable clippy on save
							-- rustfmt = {
							-- 	extraArgs = { "+nightly" },
							-- },
							cargo = {
								loadOutDirsFromCheck = true,
							},
							enable = true,
							disabled = { "unresolved-proc-macro" },
							enableExperimental = true,
						},
					},
				},
				dap = {
					adapter = {
						type = "executable",
						command = "lldb-vscode",
						name = "rt_lldb",
					},
				},
			}

			rt.setup(opts)
		end,
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

	-- neoformat
	-- {
	-- 	"sbdchd/neoformat",
	-- 	init = function()
	-- 		vim.cmd([[
	--    let g:neoformat_enabled_solidity = ['forge']
	--    let g:neoformat_enabled_toml = ['taplo']
	--    let g:neoformat_enabled_sql = ['pg_format']
	--    let g:neoformat_enabled_graphql = ['prettier']
	--    let g:neoformat_enabled_proto = ['clangformat']
	--    let g:neoformat_enabled_typescript = ['prettier']
	--    let g:neoformat_enabled_typescriptreact = ['prettier']
	--
	--    augroup fmt
	--    autocmd!
	--    autocmd BufWritePre *.sol undojoin | Neoformat
	--    autocmd BufWritePre *.toml undojoin | Neoformat
	--    autocmd BufWritePre *.sql undojoin | Neoformat
	--    autocmd BufWritePre *.proto undojoin | Neoformat
	--    autocmd BufWritePre *.graphql undojoin | Neoformat
	--    au BufWritePre *.tsx,*.ts try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
	--    augroup END
	--    ]])
	-- 	end,
	-- },
}
