require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "rust",
    "lua",
    "javascript",
    "typescript",
    "tsx",
    "solidity",
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
