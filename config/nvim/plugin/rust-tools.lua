local rt = require("rust-tools")

local opts = {
  tools = { -- rust-tools options
    hover_actions = {
      auto_focus = true,
    },
    executor = require("rust-tools/executors").termopen,
    runnables = {
      use_telescope = true
    },
  },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    standalone = true,
    -- on_attach is a callback called when the language server attachs to the buffer
    -- on_attach = on_attach,
    settings = {
      --   -- to enable rust-analyzer settings visit:
      --   -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        diagnostics = {
          warningsAsHint = { "dead_code", "unused_variables" },
        }
        --     -- enable clippy on save
        --     checkOnSave = {
        --       command = "clippy"
        --     },
      }
    },

    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })

      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },

  -- debugging stuff
  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  },
}

rt.setup(opts)
