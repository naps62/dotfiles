return {
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/guides/lazy-loading-with-lazy-nvim.md
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    lazy = true,
    config = function()
      -- This is where you modify the settings for lsp-zero
      -- Note: autocompletion settings will not take effect
      require("lsp-zero.settings").preset({})
    end,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim", "jose-elias-alvarez/typescript.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.formatting.taplo,
          null_ls.builtins.formatting.eslint_d,
          null_ls.builtins.formatting.prettierd.with({
            filetypes = {
              "html",
              "json",
              "svelte",
              "markdown",
              "css",
              "javascript",
              "javascriptreact",
              "typescript",
              "typescriptreact",
            },
          }),
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.solhint,
          null_ls.builtins.formatting.forge_fmt,
          require("typescript.extensions.null-ls.code-actions"),
          null_ls.builtins.formatting.clang_format.with({
            filetypes = {
              "glsl",
            },
          }),
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, timeout = 5000 })
              end,
            })
          end
        end,
      }
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = "kyazdani42/nvim-web-devicons",
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
    },
  },

  {
    "SmiteshP/nvim-navbuddy",
    opts = { lsp = { auto_attach = true } },
    dependencies = {
      { "SmiteshP/nvim-navic", opts = { lsp = { auto_attach = true } } },
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("nvim-navbuddy").setup({ lsp = { auto_attach = true } })
    end,
    keys = { { "<leader>b", "<cmd>Navbuddy<CR>" } },
  },
}
