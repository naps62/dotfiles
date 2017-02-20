autocmd User ProjectionistDetect
  \ call projectionist#append(getcwd(),
  \ {
  \    'web/*.ex':  {
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
