function TerraformCmd(filename, cmd)
  if(isdirectory(a:filename))
    let dir = strpart(a:filename, 0, strlen(a:filename) - 1)
  else
    let dir = a:filename
  endif
  let last_slash = strridx(dir, "/")
  let dir = strpart(dir, 0, last_slash)

  execute ":T (cd " . l:dir . " && terraform " . a:cmd . ")"
endfunction

nmap <silent> <leader>i :call TerraformCmd(@%, "init")<CR>
nmap <silent> <leader>p :call TerraformCmd(@%, "plan")<CR>
nmap <silent> <leader>a :call TerraformCmd(@%, "apply")<CR>
