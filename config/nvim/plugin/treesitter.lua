require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "rust",
    "lua",
    "javascript",
    "typescript",
    "tsx",
    "solidity",
    "graphql",
    "toml",
    "ruby",
    "bash",
    "python",
    "css",
    "markdown",
    "json"
  },
  highlight = {
    enabled = true
  },
  indentation = { enabled = true }
})

vim.api.nvim_exec([[
  augroup treesitter-highlight
    autocmd!
    autocmd BufEnter *.graphql,*.gql TSBufEnable highlight
  augroup END
]], false)
