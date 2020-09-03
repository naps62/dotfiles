augroup vimrc_syntax_scss
  autocmd User ProjectionistDetect
  \ call projectionist#append(getcwd(),
  \ {
  \    '*.scss': {
  \      'skeleton': 'comp'
  \    },
  \ })
augroup END
