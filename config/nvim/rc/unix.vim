let g:python_host_prog='/usr/bin/python3'
let g:python3_host_prog='/usr/bin/python3'

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set mouse=nicr
  endif
end
