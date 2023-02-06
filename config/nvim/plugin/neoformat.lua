vim.api.nvim_exec([[
  let g:neoformat_enabled_solidity = ['forge']
  let g:neoformat_enabled_toml = ['taplo']
  let g:neoformat_enabled_sql = ['pg_format']
  let g:neoformat_enabled_graphql = ['prettier']
  let g:neoformat_enabled_proto = ['clangformat']
  let g:neoformat_enabled_typescript = ['prettier']
  let g:neoformat_enabled_typescriptreact = ['prettier']

  augroup fmt
    autocmd!
    autocmd BufWritePre *.sol undojoin | Neoformat
    autocmd BufWritePre *.toml undojoin | Neoformat
    autocmd BufWritePre *.sql undojoin | Neoformat
    autocmd BufWritePre *.proto undojoin | Neoformat
    autocmd BufWritePre *.graphql undojoin | Neoformat
    au BufWritePre *.tsx,*.ts try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
  augroup END
]], false)
