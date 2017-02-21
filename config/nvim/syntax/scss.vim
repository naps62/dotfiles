autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    '*.scss': {
\      'skeleton': 'comp'
\    },
\ })
