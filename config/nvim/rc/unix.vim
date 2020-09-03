if has('python3')
  silent! python3 1
endif

if has('unix')
  let s:uname = system('uname')
  if s:uname ==# 'Darwin\n'
    set mouse=nicr

    let g:python_host_prog='/usr/bin/python2'
    let g:python3_host_prog='/usr/local/bin/python3'
  else
    let g:python_host_prog='/usr/bin/python2'
    let g:python3_host_prog='/usr/bin/python3'
  endif

  set shell=/bin/zsh\ -i
end
