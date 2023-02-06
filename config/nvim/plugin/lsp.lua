require('mason').setup()
require('mason-lspconfig').setup()
local lsp = require("lspconfig")
local lsp_status = require("lsp-status")

local disable_formatting = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

local enable_formatting = function(client)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
end

local capabilities = lsp_status.capabilities

local default_config = { on_attach = on_attach, capabilities = capabilities }

lsp.solidity.setup({
  on_attach = function(c, b)
    disable_formatting(c)
    lsp_status.on_attach(c, b)
  end,
  capabilities = capabilities
})


lsp.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
})

lsp.tsserver.setup(default_config)
lsp.sqls.setup(default_config)
-- lsp.graphql.setup(default_config)
lsp.tailwindcss.setup(default_config)
lsp.gopls.setup(default_config)

vim.diagnostic.config({
  virtual_text = false
})

-- show diagnostic popup on cursor hold
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]

-- auto format
vim.cmd [[autocmd BufWritePre *\(.tsx\|.ts\|.sql\|.graphql\|.sol\|.proto\)\@<! lua vim.lsp.buf.format()]]

-- auto fix eslint
-- vim.cmd [[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]
