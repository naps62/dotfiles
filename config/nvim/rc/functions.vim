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

" Return the highlight group being used under the cursor
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" run FZF in a floating window
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let width = float2nr(&columns - (&columns * 2 / 10))
  let height = 30
  let y = &lines - height - 3
  let x = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': y,
        \ 'col': x,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

function! FloatingDefX()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let width = 40
  let height = &lines - 10
  let y = 5
  let x = float2nr(&columns - width - 5)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': y,
        \ 'col': x,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
  let session_file = getcwd() . "/nvim.defx"
  echomsg session_file
  :Defx -session-file=session_file
endfunction

function! FloatingNERDTree()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let width = 40
  let height = &lines - 10
  let y = 5
  let x = float2nr(&columns - width - 5)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': y,
        \ 'col': x,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
  :edit .
endfunction

function! Focus()
  :Limelight!!
  :Goyo 120
  :VoomToggle markdown
endfunction
