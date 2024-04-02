local util = require("util")

return {
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

			return {
				defaults = {
					file_ignore_patterns = { "*.svg" },
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
					pickers = {
						find_files = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					},
				},
			}
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
		end,
		keys = {
			{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
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

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon").setup({})
		end,
		keys = {
			{
				"<leader>af",
				function()
					print("list")
					local file_paths = {}
					local harpoon = require("harpoon")
					for _, item in ipairs(harpoon:list().items) do
						table.insert(file_paths, item.value)
					end

					local conf = require("telescope.config").values
					require("telescope.pickers")
						.new({}, {
							prompt_title = "Harpoon",
							finder = require("telescope.finders").new_table({ results = file_paths }),
							previewer = conf.file_previewer({}),
							sorter = conf.generic_sorter({}),
						})
						:find()
					-- require("harpoon").list().append()
				end,
				"Harpoon list",
			},
			{
				"<leader>aa",
				function()
					print("appending")
					require("harpoon"):list():append()
				end,
				"Harpoon append",
			},
			{
				"<leader>ah",
				function()
					print("select")
					require("harpoon"):list():select(1)
				end,
				"Harpoon select 1st",
			},
			{
				"<leader>aj",
				function()
					print("select")
					require("harpoon"):list():select(2)
				end,
				"Harpoon select 2nd",
			},
			{
				"<leader>ak",
				function()
					print("select")
					require("harpoon"):list():select(3)
				end,
				"Harpoon select 3rd",
			},
			{
				"<leader>al",
				function()
					print("select")
					require("harpoon"):list():select(4)
				end,
				"Harpoon select 4th",
			},
		},
	},
}
