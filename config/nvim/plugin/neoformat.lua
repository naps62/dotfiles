vim.api.nvim_exec([[
  let g:neoformat_enabled_solidity = ['prettierd']
  let g:neoformat_enabled_sql = ['pg_format']

  augroup fmt
    autocmd!
    autocmd BufWritePre *.sol,*.sql undojoin | Neoformat
  augroup END
]], false)
