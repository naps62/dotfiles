require('nvim-lsp-installer').setup({
  ensure_installed = {
    "solc",
    "rust_analyzer",
    "tsserver"
  }
})

vim.api.nvim_exec([[
  let g:coq_settings = { 'auto_start': v:true }
]], false)

local lsp = require("lspconfig")
local coq = require("coq")

lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities())

require('rust-tools').setup({})
