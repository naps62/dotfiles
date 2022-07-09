local lsp = require("lspconfig")
local lsp_status = require("lsp-status")

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

lsp_status.register_progress()

local config = {
  capabilities = vim.tbl_extend('keep', {}, lsp_status.capabilities)
}

function disable_formatting(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

function enable_formatting(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end

lsp.solang.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilites
})
lsp.tsserver.setup({
  on_attach = function(c, b)
    disable_formatting(c, b)
    lsp_status.on_attach(c, b)
  end,
  capabilities = lsp_status.capabilites
})
lsp.sumneko_lua.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilites,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
})
lsp.sqls.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilites
})
lsp.graphql.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilites
})
lsp.tailwindcss.setup({
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilites
})
lsp.eslint.setup({
  on_attach = function(c, b)
    enable_formatting(c, b)
    lsp_status.on_attach(c, b)
  end,
  capabilities = lsp_status.capabilites,
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
vim.cmd [[autocmd BufWritePre *\(.sql\|.graphql\)\@<! lua vim.lsp.buf.format()]]
