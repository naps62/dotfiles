function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endf
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')

" function! RemoveUnwantedWhitespace()
"   execute "normal mq"

"   let s:regex = '(\S\s\zs\s+\ze\S)'
"   execute 'g/\v' . s:regex . '/s'

"   execute "normal `q"
" endf

" au BufWritePre *.rb call CleanupUnwantedWhitespace()

" function! DoProjectWide(files, cmd)
"   echo "Performing " . a:cmd . " on all files matching " . a:files

"   execute "args " . a:files
"   execute "silent! argdo silent! " . a:cmd . " | write"

"   echo "Done!"
" endfunction

" command! -nargs=* ProjectWide call DoProjectWide(<f-args>)
