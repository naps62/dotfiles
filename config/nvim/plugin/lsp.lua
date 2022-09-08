local lsp = require("lspconfig")
local lsp_status = require("lsp-status")

require('nvim-lsp-installer').setup({
  ensure_installed = {
    "solang",
    -- "rust_analyzer",
    "tsserver",
    "eslint",
    "sumneko_lua",
    "graphql",
    "tailwindcss",
    "gopls"
  }
})

lsp_status.register_progress()

function DisableFormatting(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

function EnableFormatting(client)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
end

local capabilities = lsp_status.capabilities

lsp.solang.setup({ on_attach = on_attach, capabilities = capabilities })
lsp.tsserver.setup({
  on_attach = function(c, b)
    DisableFormatting(c)
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
lsp.eslint.setup({
  on_attach = function(c, b)
    EnableFormatting(c)
    on_attach(c, b)
  end,
  capabilities = capabilities,
  settings = {
    enable = true,
    format = { enable = true }, -- this will enable formatting
    packageManager = "npm",
    autoFixOnSave = true,
    codeActionsOnSave = {
      mode = "all",
      rules = { "!debugger", "!no-only-tests/*" },
    },
    lintTask = {
      enable = true,
    },
  }
})
lsp.gopls.setup({ on_attach = on_attach, capabilities = capabilities })

vim.diagnostic.config({
  virtual_text = false
})

require('trouble').setup()

require('toggle_lsp_diagnostics').init()

-- show diagnostic popup on cursor hold
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]

-- auto format
vim.cmd [[autocmd BufWritePre *\(.sql\|.graphql\|.sol\|.proto\)\@<! lua vim.lsp.buf.format()]]
