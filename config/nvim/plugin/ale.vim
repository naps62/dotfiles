let g:ale_sign_column_always = 1
let g:ale_emit_conflict_warnings = 0
let g:ale_ruby_rubocop_options = '--except Lint/Debugger'
let g:ale_sign_error = '→'
let g:ale_sign_warning = '→'
let g:ale_fix_on_save = 1
let g:ale_elixir_elixir_ls_release = $HOME . './elixir_ls'

let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1

let g:ale_linters = {
      \ 'ruby':  ['rubocop'],
      \ 'python': [],
      \ 'elixir': [],
      \ 'typescript': [],
      \ 'javascript': [],
      \ 'solidity': ['solium'],
      \ 'cs': [],
      \ 'rust': [],
      \ 'terraform': ['tflint'],
      \ 'css': ['prettier'],
      \ 'md': ['proselint', 'languagetool'],
      \ 'vim': ['vint'],
      \ 'scss': []
      \ }

let g:ale_fixers = {
      \ 'ruby':  ['rubocop'],
      \ 'typescript': [],
      \ 'javascript': [],
      \ 'elixir': ['mix_format'],
      \ 'solidity': [],
      \ 'rust': [],
      \ 'terraform': ['terraform'],
      \ 'css': ['prettier'],
      \ 'html': ['html-beautify'],
      \ 'htmldjango': ['html-beautify'],
      \ 'eelixir': [],
      \ 'scss': []
      \ }

function! LoadNearestMixFormatter()
  let l:formatters = []
  let l:directory = fnameescape(expand('%:p:h'))

  let l:git_root = system('git rev-parse --show-toplevel')[:-2]

  let l:fmt = findfile('.formatter.exs', l:git_root)

  let g:ale_elixir_mix_format_options = '--dot-formatter ' . l:fmt
endfunction

call LoadNearestMixFormatter()

function! AddLinterIfFileExists(lang, linter, file, lint, fix)
  let l:current = g:ale_linters[a:lang]

  if filereadable(a:file) && index(l:current, a:linter) == -1
    if a:lint
      let g:ale_linters[a:lang] = g:ale_linters[a:lang] + [a:linter]
    endif
    if a:fix
      let g:ale_fixers[a:lang] = g:ale_fixers[a:lang] + [a:linter]
    end
  endif
endfunction

" call AddLinterIfFileExists('javascript', 'eslint', 'node_modules/.bin/eslint', 1, 1)
" call AddLinterIfFileExists('typescript', 'eslint', 'node_modules/.bin/eslint', 1, 1)
" call AddLinterIfFileExists('javascript', 'prettier', 'node_modules/.bin/prettier', 1, 1)
" call AddLinterIfFileExists('typescript', 'prettier', 'node_modules/.bin/prettier', 1, 1)
call AddLinterIfFileExists('scss', 'stylelint', '.stylelintrc', 1, 0)
" call AddLinterIfFileExists('ruby', 'rubocop', '.rubocop.yml', 1, 1)
call AddLinterIfFileExists('elixir', 'credo', 'config/.credo.exs', 1, 0)
" call AddLinterIfFileExists('scss', 'stylelint', 'node_modules/.bin/stylelint', 1, 1)

"
" connecting ale omnisharp to unity
let g:ale_cs_mcsc_assemblies = [
    \ '/home/naps62/.unity/2020.1.13f1/Editor/Data/Managed/UnityEngine/UnityEngine.dll',
    \ '/home/naps62/projects/poly/obj/Debug',
    \]
