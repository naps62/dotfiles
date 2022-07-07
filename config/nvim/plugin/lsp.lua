local lsp = require("lspconfig")

require('nvim-lsp-installer').setup({
  ensure_installed = {
    "solang",
    "rust_analyzer",
    "tsserver",
    "eslint",
    "sumneko_lua",
    "graphql",
    "tailwindcss"
  }
})

function disable_formatting(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

function enable_formatting(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end

lsp.solang.setup({})
lsp.tsserver.setup({
  on_attach = disable_formatting
})
lsp.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
})
lsp.sqls.setup({})
--lsp.graphql.setup({})
--lsp.tailwindcss.setup({})
lsp.eslint.setup({
  on_attach = enable_formatting,
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


require('trouble').setup()

-- show diagnostic popup on cursor hold
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]

-- auto format
vim.cmd [[autocmd BufWritePre *\(.sql\)\@<! lua vim.lsp.buf.formatting_sync(nil, 200)]]
