if has('python3')
  silent! python3 1
endif

if has('unix')
  let g:python2_host_prog='python2'
  let g:python3_host_prog='python3'

  set shell=/bin/zsh\ -i
end
