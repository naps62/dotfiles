map <buffer> <leader>d odebugger<Esc>:w<CR>
map <buffer> <C-]> :TernDef<CR>

function! JSAddLinterIfFileExists(linter, file)
  let l:current = g:ale_linters.javascript

  if filereadable(a:file) && index(l:current, a:linter) == -1
    let g:ale_linters.javascript = g:ale_linters.javascript + [a:linter]
    let g:ale_fixers.javascript = g:ale_linters.javascript + [a:linter]
  endif
endfunction

call JSAddLinterIfFileExists('eslint', '.eslintrc.json')
call JSAddLinterIfFileExists('standard', 'node_modules/.bin/standard')
