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
