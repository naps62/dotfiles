autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'web/*.ex':  {
\       'alternate': 'test/{}_test.exs'
\    },
\    'web/models/*.ex':  {
\       'skeleton': 'ectomodel',
\       'alternate': 'test/{}_test.exs'
\    },
\    'test/*_test.exs':  {
\      'alternate': 'web/{}.ex',
\      'skeleton': 'modelcase'
\     },
\    'test/controllers/*_test.exs': {
\       'skeleton': 'conncase'
\     }
\ })
