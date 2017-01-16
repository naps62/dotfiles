let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'
autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>

source ~/.vimrc
