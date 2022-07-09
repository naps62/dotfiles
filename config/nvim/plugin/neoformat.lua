vim.api.nvim_exec([[
  let g:neoformat_enabled_solidity = ['prettierd']
  let g:neoformat_enabled_sql = ['pg_format']
  let g:neoformat_enabled_graphql = ['prettierd']

  augroup fmt
    autocmd!
    autocmd BufWritePre *.sol undojoin | Neoformat
    autocmd BufWritePre *.sql undojoin | Neoformat
    autocmd BufWritePre *.graphql,*.gql undojoin | Neoformat
  augroup END
]], false)
