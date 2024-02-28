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
    "akinsho/toggleterm.nvim",
    tag = "v2.10.0",
    lazy = false,
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

  {
    "pwntester/octo.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("octo").setup()
    end,
  },

  {
    "willothy/flatten.nvim",
    opts = { window = { open = "alternate" } },
    lazy = false,
    priority = 1001,
    keys = {
      { "<leader>hi", ":Octo issue list is:open<CR>", desc = "Github Issues" },
      { "<leader>hI", ":Octo issue create<CR>",       desc = "Github Issues" },
      { "<leader>hp", ":Octo pr list is:open<CR>",    desc = "Github PRs" },
      { "<leader>hP", ":Octo pr create<CR>",          desc = "Github PRs" },
    },
  },
}
