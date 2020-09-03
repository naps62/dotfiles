augroup vimrc_syntax_elixir
  autocmd User ProjectionistDetect
  \ call projectionist#append(getcwd(),
  \ {
  \    'lib/*.ex':  {
  \       'skeleton': 'mod',
  \       'alternate': 'test/{}_test.exs'
  \    },
  \    'test/*_test.exs':  {
  \      'alternate': 'lib/{}.ex',
  \      'skeleton': 'case'
  \     },
  \ })
augroup END
