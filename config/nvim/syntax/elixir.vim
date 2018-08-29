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

let g:naps62_elixir_test_env_file = ""

function! ElixirMixTestTransform(cmd) abort
  if match(a:cmd, "apps/") != -1
    let pattern = 'mix test apps/\([^/]*/\)\(.*\)'
    let matches = matchlist(a:cmd, pattern)

    return 'cd apps/'.matches[1].' && mix test '.matches[2].'; cd -'
  else
    return a:cmd
  end
endfunction

let s:git_home = substitute(system("git home"), '\n\+$', '', '')
let s:git_prefix = substitute(system("git rev-parse --show-prefix"), '\n\+$', '', '')

function! ElixirCustomTestRunner(cmd) abort
  let l:env_file = s:git_prefix . g:naps62_elixir_test_env_file

  let l:test_runner = "mix test"
  if g:naps62_elixir_test_runner != ""
    let l:test_runner = g:naps62_elixir_test_runner
  endif

  let pattern = 'mix test \?\(.*\)$'
  let matches = matchlist(a:cmd, pattern)

  let path = ""
  if get(l:matches, 1, "") != ""
    let path = s:git_prefix . l:matches[1]
  endif

  return "cd " . s:git_home . " && " . l:test_runner . " " . l:path
endfunction

let g:test#custom_transformations = {
  \ 'elixir': function('ElixirCustomTestRunner')
  \ }

let g:test#transformation = 'elixir'
