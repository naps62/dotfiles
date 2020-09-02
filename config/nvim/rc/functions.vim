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

let g:naps62_focused = 0
function! Focus()
  let g:naps62_focused = 1 - g:naps62_focused

  if g:naps62_focused == 1
    let b:coc_suggest_disable = 1
    :Goyo 120
    :Limelight
    :Voom markdown
    :exe "normal \<C-w>\<C-w>"

    set nocursorline
    set nocursorcolumn
    set noshowmode

    :nmap j jzz
    :nmap k kzz
    :nmap G Gzz

    :silent !xdotool key --repeat 10 Ctrl+apostrophe
    :silent !tmux set status off
  else
    let b:coc_suggest_disable = 0
    :Goyo!
    :Limelight!
    :Voomquit

    set cursorline
    set cursorcolumn
    set showmode

    :unmap j
    :unmap k
    :unmap G

    :silent !xdotool key Ctrl+0
    :silent !tmux set status on
  endif
endfunction

function! FindDoc()
  let word = substitute(expand("<cword>"), 'aws_', '', '')
  let url = "https://www.terraform.io/docs/providers/aws/r/".word.".html"
  silent exec "!open ".url
endfunction
