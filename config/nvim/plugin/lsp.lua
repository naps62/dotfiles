local lsp = require("lspconfig")
local coq = require("coq")

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


lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities())
lsp.solc.setup(coq.lsp_ensure_capabilities())
lsp.tsserver.setup(coq.lsp_ensure_capabilities())

require('rust-tools').setup({})

-- auto format
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
