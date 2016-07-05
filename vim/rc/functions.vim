function OpenTODO()
  if @% == "" && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    " no filename for current buffer
    " and only 1 buffer open
    execute "edit /home/naps62/todo/todo.txt"
    execute "set syntax=todo"
  endif
endfunction
nmap <localleader>1 iasd<Esc>

au VimEnter * nested call OpenTODO()
