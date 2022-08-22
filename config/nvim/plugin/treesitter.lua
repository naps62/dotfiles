vim.api.nvim_exec([[
    augroup treesitter-highlight
      autocmd!
      autocmd BufEnter *.graphql,*.gql,*.elixir TSBufEnable highlight
    augroup END

    augroup custom-syntax
      autocmd!
      autocmd BufEnter *.cairo set syntax=cairo
    augroup END
  ]],
  false)

vim.api.nvim_exec([[
    autocmd Syntax * syntax match solNatspecTag "\v\@\w+" containedin=solComment,solLineComment
    autocmd Syntax * syntax match solNatspecRef "\v\{\w+\}" containedin=solComment,solLineComment
    autocmd Syntax * highlight! link solNatspecTag solKeyword
    autocmd Syntax * highlight! link solNatspecRef solFuncName
]], false)
