let g:foldtoggle=0

function! FoldToggle()
  if g:foldtoggle
    let g:foldtoggle = 0
    execute "wincmd ="
  else
    let g:foldtoggle = 1
    execute "wincmd _"
    execute "wincmd |"
  endif
endfunction

function! RemoveTrailingWhitespaces()
  :%s/\s\+$//e
endfunction

"
" SCSS Rule ordering
"
function! ScssSortRules()
  let l:sort_command = "sort"
  execute ":g#\\({\\n\\)\\@<=#.,/\\.*[{}]\\@=/-1 call ScssAddPrefix()"
  execute ":g#\\({\\n\\)\\@<=#.,/\\.*[{}]\\@=/-1 sort n"
  execute ":g#\\({\\n\\)\\@<=#.,/\\.*[{}]\\@=/-1 call ScssRemovePrefix()"
endfunction

function! ScssAddPrefix() range
  for lineno in range(a:firstline, a:lastline)
    let line = getline(lineno)
    let prefixed_line = substitute(line, "^", ScssRuleOrderingScore(line), "")
    call setline(lineno, prefixed_line)
  endfor
endfunction

function! ScssRemovePrefix() range
  for lineno in range(a:firstline, a:lastline)
    let prefixed_line = getline(lineno)
    let line = substitute(prefixed_line, "^\\d\\+", "", "")
    call setline(lineno, line)
  endfor
endfunction

function! ScssRuleOrderingScore(line)
  let l:property = substitute(a:line, "^\\s\\+", "", "g")
  let l:property = substitute(l:property, ":.*$", "", "g")
  let l:cmd = "sed -n '/^" . l:property . "$/{=;}' ~/.config/nvim/data/scss-rule-order.txt"
  let l:result = system(l:cmd) + 0
  return l:result
endfunction

" Rename the current file
function! Rename()
  let current = expand('%')
  let new_file = input('New name: ', current)
  if new_file != current && new_file != ''
    exec ':saveas ' . new_file
    exec ':silent !rm ' . current
    redraw!
  endif
endfunction
