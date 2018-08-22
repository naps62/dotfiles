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

function! ElixirCustomTestRunner(cmd) abort
  let env_file = g:naps62_elixir_test_env_file
  if filereadable("../../" . env_file)
    let env_file = "../../" . env_file
  end

  if a:cmd =~ "mix test"
    let final_cmd = substitute(a:cmd, "mix test", "source " . env_file ."; mix test", "")
    return final_cmd
  else
    return a:cmd
  end
endfunction

" Ability to run elixir tests while on their alternate file
let test#elixir#exunit#file_pattern = '\.ex'

let g:test#custom_transformations = {
  \ 'elixir': function('ElixirCustomTestRunner')
  \ }

let g:test#transformation = 'elixir'
