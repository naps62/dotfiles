vim.api.nvim_exec([[
  let g:neoformat_enabled_solidity = ['prettierd']

  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]], false)
