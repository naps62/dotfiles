return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    version = false,
    build = ":TSUpdate",
    event = "BufReadPre",
    init = function()
      vim.api.nvim_exec(
        [[
      " augroup treesitter-highlight
      " autocmd!
      " autocmd BufEnter *.graphql,*.gql,*.elixir,*.md TSBufEnable highlight
      " augroup END

      augroup custom-syntax
      autocmd!
      autocmd BufEnter *.cairo set syntax=cairo
      autocmd BufEnter *.wit set syntax=typescript
      autocmd Syntax *.sol syntax match solNatspecTag "\v\@\w+" containedin=solComment,solLineComment
      autocmd Syntax *.sol syntax match solNatspecRef "\v\{\w+\}" containedin=solComment,solLineComment
      autocmd Syntax *.sol highlight! link solNatspecTag solKeyword
      autocmd Syntax *.sol highlight! link solNatspecRef solFuncName
      augroup END
      ]],
        false
      )
    end,
    opts = {
      highlight = { enable = true, use_languagetree = true },
      indent = { enable = true },
      ensure_installed = {
        "rust",
        "lua",
        "regex",
        "html",
        "javascript",
        "typescript",
        "tsx",
        "solidity",
        "toml",
        "bash",
        "css",
        "markdown",
        "markdown_inline",
        "json",
        "elixir",
        "erlang",
        "eex",
        "kdl",
        "yuck",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      vim.treesitter.language.register('markdown', 'mdx')
    end,
  },

  { "tomlion/vim-solidity" },
  { "vmchale/just-vim" },
  { "kaarmu/typst.vim" },
  { "fladson/vim-kitty" },
  { "terrastruct/d2-vim" },
}
