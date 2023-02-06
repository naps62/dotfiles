_G.set_terminal_keymaps = function()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

return {
	{
		"christoomey/vim-tmux-navigator",
		init = function()
			vim.cmd([[
        let g:tmux_navigator_no_mappings = 1

        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
      ]])
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		tag = "2.3.0",
		config = function()
			require("toggleterm").setup({

				size = 50,
				open_mapping = [[<c-\>]],
				direction = "vertical",
				autochdir = true,
			})

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
		keys = {
			{
				"<leader>g",
				function()
					local Terminal = require("toggleterm.terminal").Terminal
					local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

					lazygit:toggle()
				end,
				desc = "lazygit",
			},
		},
	},
}
