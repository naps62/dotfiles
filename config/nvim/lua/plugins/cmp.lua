return {
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = function()
			local types = require("luasnip.util.types")

			return {
				history = true,
				update_events = "TextChanged,TextChangedI",
				delete_check_events = "TextChanged",
				ext_opts = {
					[types.choiceNode] = {
						active = {
							virt_text = { { "choiceNode", "Comment" } },
						},
					},
				},
				-- treesitter-hl has 100, use something higher (default is 200).
				ext_base_prio = 300,
				-- minimal increase in priority.
				ext_prio_increase = 1,
				enable_autosnippets = true,
				-- mapping for cutting selected text so it's usable as SELECT_DEDENT,
				-- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
				store_selection_keys = "<Tab>",
			}
		end,
		-- TODO are these working?
		keys = {
			{ "<C-.>", "<cmd>luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", mode = "i" },
			{ "<C-.>", "<cmd>luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", mode = "s" },
			cmp,
		},
		config = function(_, opts)
			require("luasnip").config.set_config(opts)
			require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" })
		end,
	},

	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local cmp_next_item = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" })

			local cmp_prev_item = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" })

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			return {
				completion = {
					completeopt = "menu,menuone,noselect,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					-- Add tab support
					["<S-Tab>"] = cmp_prev_item,
					["<Tab>"] = cmp_next_item,
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = false,
					}),
				}),
				-- Never select any item by default
				preselect = cmp.PreselectMode.None,
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "copilot" },
					{ name = "path" },
					{ name = "buffer" },
				}),
				formatting = {
					format = function(_, item)
						local icons = require("config.icons").kinds
						if icons[item.kind] then
							item.kind = icons[item.kind] .. item.kind
						end
						return item
					end,
				},
				-- experimental = {
				-- 	ghost_text = {
				-- 		hl_group = "LspCodeLens",
				-- 	},
				-- },
			}
		end,
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
