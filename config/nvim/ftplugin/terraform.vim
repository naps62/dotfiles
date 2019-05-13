function! TerraformCmd(filename, cmd)
  if(isdirectory(a:filename))
    let dir = strpart(a:filename, 0, strlen(a:filename) - 1)
  else
    let dir = a:filename
  endif
  let last_slash = strridx(dir, "/")
  let dir = strpart(dir, 0, last_slash)

  execute ":T (cd " . l:dir . " && direnv exec . terraform " . a:cmd . ")"
endfunction

nmap <silent> <leader>i :call TerraformCmd(@%, "init")<CR>
nmap <silent> <leader>p :call TerraformCmd(@%, "plan -parallelism=30")<CR>
nmap <silent> <leader>a :call TerraformCmd(@%, "apply -parallelism=30")<CR>
nmap <silent> <leader>o :call TerraformCmd(@%, "output")<CR>
nmap <silent> <leader>r :call TerraformCmd(@%, "refresh")<CR>
nmap <silent> <leader>d :call TerraformCmd(@%, "destroy")<CR>
