if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set mouse=nicr
  endif

  let g:python_host_prog='/usr/bin/python2'
  let g:python3_host_prog='/usr/bin/python3'
end
