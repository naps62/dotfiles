set textwidth=80
set colorcolumn=80

augroup markdown
  autocmd!
  BufRead,BufNewFile *.md setlocal textwidth=80
augroup END
