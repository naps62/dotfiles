--require('project_nvim').setup({
--  detection_methods = {
--    "!~/.cargo/*",
--  },
--
--  patterns = { ".git" },
--})

require('nvim-autopairs').setup()
require('hop').setup()
require("lspsaga").init_lsp_saga({
  symbol_in_winbar = {}
})

vim.cmd [[let g:rooter_patterns = ['.git'] ]]
