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


-- lsp.solc.setup({
--   on_attach = function(c, b)
--     disable_formatting(c)
--     lsp_status.on_attach(c, b)
--   end,
--   capabilities = capabilities,
--   settings = {
--     ["include-paths"] = {
--       "./lib/"
--     }
--   }
-- })
lsp.solidity.setup({
  on_attach = function(c, b)
    disable_formatting(c)
    lsp_status.on_attach(c, b)
  end,
  capabilities = capabilities
})

lsp.tsserver.setup({
  on_attach = function(c, b)
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

lsp.sqls.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.graphql.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.tailwindcss.setup({ on_attach = on_attach, capabilities = capabilities })

lsp.clangd.setup({
  on_attach = function(c, b)
    disable_formatting(c)
    lsp_status.on_attach(c, b)
  end,
  capabilities = capabilities
})

lsp.eslint.setup({
  -- on_attach = function(c, b)
  --   enable_formatting(c)
  --   on_attach(c, b)
  -- end,
  -- capabilities = capabilities,
  -- settings = {
  --   enable = true,
  --   format = { enable = true }, -- this will enable formatting
  --   packageManager = "npm",
  --   autoFixOnSave = true,
  --   codeActionsOnSave = {
  --     mode = "all",
  --     rules = { "!debugger", "!no-only-tests/*" },
  --   },
  --   lintTask = {
  --     enable = true,
  --   },
  -- }
})

lsp.gopls.setup({ on_attach = on_attach, capabilities = capabilities })

vim.diagnostic.config({
  virtual_text = false
})

require('trouble').setup()
require('toggle_lsp_diagnostics').init({ virtual_text = false })

-- show diagnostic popup on cursor hold
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]

-- auto format
vim.cmd [[autocmd BufWritePre *\(.sql\|.graphql\|.sol\|.proto\)\@<! lua vim.lsp.buf.format()]]

-- auto fix eslint
vim.cmd [[autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll]]
