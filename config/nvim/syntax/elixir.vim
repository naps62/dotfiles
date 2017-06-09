autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'web/*.ex':  {
\       'alternate': 'test/{}_test.exs'
\    },
\    'lib/*.ex':  {
\       'alternate': 'test/{}_test.exs'
\    },
\    'web/models/*.ex':  {
\       'skeleton': 'ectomodel',
\       'alternate': 'test/{}_test.exs'
\    },
\    'test/*_test.exs':  {
\      'alternate': 'lib/{}.ex',
\      'skeleton': 'case'
\     },
\    'test/controllers/*_test.exs': {
\       'skeleton': 'conncase'
\     }
\ })
