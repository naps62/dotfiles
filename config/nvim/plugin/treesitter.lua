vim.api.nvim_exec([[
    augroup treesitter-highlight
      autocmd!
      autocmd BufEnter *.graphql,*.gql,*.elixir TSBufEnable highlight
    augroup END
  ]],
  false)
