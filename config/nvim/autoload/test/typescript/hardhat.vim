if !exists('g:test#typescript#hardhat#file_pattern')
  let g:test#typescript#hardhat#file_pattern = '\v\.test\.ts$'
endif

" Returns true if the given file belongs to your test runner
function! test#typescript#hardhat#test_file(file) abort
  if a:file =~# g:test#typescript#hardhat#file_pattern
    if exists('g:test#typescript#runner')
      return g:test#typescript#runner ==# 'hardhat'
    endif
  endif
endfunction

" Returns test runner's arguments which will run the current file and/or line
function! test#typescript#hardhat#build_position(type, position) abort
  let default = ['--require', 'ts-node/register', '--require', 'hardhat/register']
  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      let name = '--grep '.shellescape(name, 1)
    endif
    return default + [a:position['file'], name]
  elseif a:type ==# 'file'
    return default + [a:position['file']]
  else
    let test_directory = (split(fnamemodify(a:position['file'], ':h'), '\/')[0])

    if test_directory =~# '\v^tests?$'
        return default + ['test', test_directory]
    endif

    return default + ["' . test_directory . '/**/*.' . fnamemodify(a:position['file'], ':e:e:e') . '"']
  endif
endfunction

" Returns processed args (if you need to do any processing)
function! test#typescript#hardhat#build_args(args, color) abort
  let args = a:args

  if !a:color
    let args = ['--no-colors'] + args
    let args = args + ['|', 'sed -e "s///g"']
  endif

  return args
endfunction

" Returns the executable of your test runner
function! test#typescript#hardhat#executable()
  if filereadable('node_modules/.bin/hardhat')
    return 'node_modules/.bin/mocha'
  else
    return 'mocha'
  endif
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#javascript#patterns)
  return (len(name['namespace']) ? '^' : '') .
       \ test#base#escape_regex(join(name['namespace'] + name['test'])) .
       \ (len(name['test']) ? '$' : '')
endfunction
