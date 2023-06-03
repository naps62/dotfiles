return {
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		opts = function()
			local icons = require("config.icons")

			local function fg(name)
				return function()
					---@type {foreground?:number}?
					local hl = vim.api.nvim_get_hl_by_name(name, true)
					return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
				end
			end

			return {
				options = {
					theme = "catppuccin-mocha",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
						{
							"filetype",
							icon_only = true,
							separator = "",
							padding = {
								left = 1,
								right = 0,
							},
						},
						{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
						{
							function()
								return require("nvim-navic").get_location()
							end,
							cond = function()
								return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
							end,
						},
					},
					lualine_x = {
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							color = fg("Special"),
						},
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return os.date("%R")
						end,
					},
				},
				winbar = {
					lualine_a = {},
				},
				extensions = { "nvim-tree", "toggleterm" },
			}
		end,
	},

	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},

	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait til new 0.7.0 release to put it back on semver
		event = "BufReadPre",
		opts = function()
			return {
				draw = {
					delay = 0,
					animation = require("mini.indentscope").gen_animation.none(),
				},
				symbol = "│",
				options = { try_as_border = true },
			}
		end,
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "nvim-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},

	-- {
	-- 	"SmiteshP/nvim-navic",
	-- 	dependencies = { "neovim/nvim-lspconfig" },
	-- 	lazy = false,
	-- 	init = function()
	-- 		vim.g.navic_silence = false
	-- 		require("util").on_attach(function(client, buffer)
	-- 			if client.server_capabilities.documentSymbolProvider then
	-- 				require("nvim-navic").attach(client, buffer)
	-- 			end
	-- 		end)
	-- 	end,
	-- 	opts = function()
	-- 		return {
	-- 			separator = " ",
	-- 			highlight = true,
	-- 			depth_limit = 5,
	-- 			icons = require("config.icons").kinds,
	-- 		}
	-- 	end,
	-- },

	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },

	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
}
