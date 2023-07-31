local util = require("util")

return {
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern" },
				patterns = { ".git", "yarn.lock" },
			})
		end,
	},

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-ui-select.nvim",
	{ "junegunn/fzf", build = ":call fzf#install()" },
	"junegunn/fzf.vim",

	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		version = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			local actions = require("telescope.actions")

			vim.api.nvim_exec(
				[[
	      command! -bang -nargs=* FzfRgSlim call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --ignore-file lib/ -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
	      ]],
				false
			)

			return {
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					mappings = {
						i = {
							["<c-t>"] = function(...)
								return require("trouble.providers.telescope").open_with_trouble(...)
							end,
							["<a-i>"] = function()
								util.telescope("find_files", { no_ignore = true })()
							end,
							["<a-h>"] = function()
								util.telescope("find_files", { hidden = true })()
							end,
							["<C-Down>"] = function(...)
								return require("telescope.actions").cycle_history_next(...)
							end,
							["<C-Up>"] = function(...)
								return require("telescope.actions").cycle_history_prev(...)
							end,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-c>"] = actions.close,
						},
					},
				},
			}
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("projects")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("harpoon")
		end,
		keys = {
			{ "<C-p>", util.telescope("files"), desc = "Find Files (root dir)" },
			{ "<C-.>", "<cmd>Telescope projects<cr>", desc = "Find Projects" },
			{ "<C-f>", "<cmd>Rg<cr>", desc = "fuzzy find file contents" },
			{
				"<leader>ss",
				util.telescope("lsp_document_symbols", {
					symbols = {
						"Class",
						"Function",
						"Method",
						"Constructor",
						"Interface",
						"Module",
						"Struct",
						"Trait",
						"Field",
						"Property",
					},
				}),
				desc = "Go to Symbol",
			},
		},
	},
}
