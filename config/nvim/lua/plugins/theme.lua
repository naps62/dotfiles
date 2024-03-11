return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    init = function()
      vim.cmd.colorscheme("catppuccin-mocha")
      require("catppuccin").setup({
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
}
