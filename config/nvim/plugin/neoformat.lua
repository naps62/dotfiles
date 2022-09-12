vim.api.nvim_exec([[
  let g:neoformat_enabled_solidity = ['prettierd']
  let g:neoformat_enabled_sql = ['pg_format']
  let g:neoformat_enabled_graphql = ['prettier']
  let g:neoformat_enabled_proto = ['clangformat']

  augroup fmt
    autocmd!
    autocmd BufWritePre *.sol undojoin | Neoformat
    autocmd BufWritePre *.sql undojoin | Neoformat
    autocmd BufWritePre *.proto undojoin | Neoformat
    autocmd BufWritePre *.graphql undojoin | Neoformat
  augroup END
]], false)
