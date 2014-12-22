function! AirlineThemePatch(pallete)
  if $USER == "root"
    call WhiteOnRed(a:pallete.normal)
    call WhiteOnRed(a:pallete.normal_modified)
    call WhiteOnRed(a:pallete.insert)
    call WhiteOnRed(a:pallete.insert_modified)
  endif
endfunction

function! WhiteOnRed(subpallete)
  for colors in values(a:subpallete)
    let colors[2] = 'white'
    let colors[3] = 'red'
  endfor
endfunction
