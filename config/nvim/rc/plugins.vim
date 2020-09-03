filetype off

let $PYTHONPATH='/usr/lib/python3.4/site-packages'

" vundle
call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'

" UI Features
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'jonathanfilip/vim-lucius'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-vinegar'

" Find & Replace
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'stefandtw/quickfix-reflector.vim'


" Unit testing
Plug 'janko-m/vim-test', { 'on': ['TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'] }
Plug 'kassio/neoterm'

" Editor features
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'SirVer/ultisnips'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'kana/vim-textobj-user'
Plug 'andymass/vim-matchup'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'embear/vim-localvimrc'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf'

" Navigation
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'wellle/targets.vim'
Plug 'pechorin/any-jump.vim'

" Write mode
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'markdown.mdx'] }
Plug 'junegunn/limelight.vim', { 'for': ['markdown', 'markdown.mdx'] }
Plug 'vim-voom/VOoM', { 'for': ['markdown', 'markdown.mdx'] }

" Linters
Plug 'dense-analysis/ale'

" Ruby
Plug 'vim-ruby/vim-ruby',    { 'for': 'ruby' }
Plug 'tpope/vim-bundler',    { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }
Plug 'tpope/vim-endwise',    { 'for': ['ruby', 'elixir'] }
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}

" JS
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',             { 'for': ['javascript', 'javascript.jsx'] }

" Typescript
Plug 'leafgarland/typescript-vim'

" HTML
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'javascript.jsx', 'typescript', 'javascript.tsx', 'typescript.tsx'] }

" JSON
Plug 'elzr/vim-json',    { 'for': 'json' }

" Other syntaxes
Plug 'tpope/vim-git'
Plug 'vim-scripts/SyntaxRange'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
Plug 'peitalin/vim-jsx-typescript', { 'for': 'tsx' }
Plug 'jxnblk/vim-mdx-js', { 'for': 'markdown.mdx' }

call plug#end()
filetype plugin indent on

"
" treesitter
"
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "all",     -- one of "all", "language", or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = { "typescript", "javascript" },  -- list of language that will be disabled
"   },
"   refactor = {
"     highlight_definitions = { enable = true },
"     highlight_current_scope = { enable = true },
"   },
" }
" EOF

" markdown
let g:markdown_fenced_languages = ['elixir', 'sh', 'rust']

"
" neoterm
"
let g:neoterm_size='70'
let g:neoterm_default_mod = 'vertical'
let g:neoterm_autoscroll = 1
let g:neoterm_repl_ruby = 'pry'
let g:neoterm_keep_term_open = 1

nnoremap <silent> <leader>th :call neoterm#close()<CR>
nnoremap <silent> <leader>tl :call neoterm#clear()<CR>
nnoremap <silent> <leader>tk :call neoterm#kill()<CR>
tmap <silent> <C-e> <C-\><C-n>

"
" quick-scope
"
let g:qs_max_chars=80

"
" vim-test
"
let test#strategy = 'neoterm'

map <leader>sr :TestSuite<CR>
map <leader>ss :TestNearest<CR>
map <leader>sf :TestFile<CR>
map <leader>sl :TestLast<CR>

"
" fugitive.vim (git wrapper)
"
set diffopt+=vertical
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gw :Gbrowse<CR>

"
" lightline
"
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
  \ 'separator': { 'left': '', 'right': '' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ },
  \ }

"
" ripgrep
"
if executable('rg')
  " use Ripgrep over Grep
  set grepprg="rg --color never --no-heading"
endif

"
" auto-pairs
"
" let g:AutoPairsMultilineClose = 0
" let g:AutoPairsOnlyWhitespace = 1

"
" UltiSnips
"
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsEdit='vertical'

"
" vim-gitgutter
"
let g:gitgutter_override_sign_column_highlight = 0

"
" ale
let g:ale_sign_column_always = 1
let g:ale_emit_conflict_warnings = 0
let g:ale_ruby_rubocop_options = '--except Lint/Debugger'
let g:ale_sign_error = '→'
let g:ale_sign_warning = '→'
let g:ale_fix_on_save = 1
let g:ale_elixir_elixir_ls_release = $HOME . './elixir_ls'

let g:ale_linters = {
      \ 'ruby': [],
      \ 'python': [],
      \ 'elixir': [],
      \ 'typescript': ['tslint', 'tsserver'],
      \ 'javascript': ['prettier'],
      \ 'scss': [],
      \ 'solidity': ['solium'],
      \ 'cs': ['OmniSharp'],
      \ 'rust': [],
      \ 'terraform': ['tflint'],
      \ 'css': ['prettier'],
      \ 'md': ['proselint', 'languagetool'],
      \ 'vim': ['vint']
      \ }

let g:ale_fixers = {
      \ 'ruby':  [],
      \ 'typescript': ['tslint', 'prettier'],
      \ 'javascript': ['prettier'],
      \ 'elixir': ['mix_format'],
      \ 'solidity': [],
      \ 'rust': ['rustfmt'],
      \ 'terraform': ['terraform'],
      \ 'css': ['prettier'],
      \ 'html': ['html-beautify'],
      \ 'htmldjango': ['html-beautify'],
      \ 'eelixir': []
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
      let g:ale_fixers[a:lang] = g:ale_linters[a:lang] + [a:linter]
    end
  endif
endfunction

call AddLinterIfFileExists('javascript', 'eslint', '.eslintrc.json', 1, 1)
call AddLinterIfFileExists('javascript', 'standard', 'node_modules/.bin/standard', 1, 1)
call AddLinterIfFileExists('javascript', 'prettier', 'node_modules/.bin/prettier', 1, 1)
call AddLinterIfFileExists('scss', 'stylelint', '.stylelintrc', 1, 0)
call AddLinterIfFileExists('ruby', 'rubocop', '.rubocop.yml', 1, 1)
call AddLinterIfFileExists('elixir', 'credo', 'config/.credo.exs', 1, 0)

"
" vim-projectionist
"
map <leader>aa :A<CR>
nmap <leader>av :AV<CR>
map <leader>as :AS<CR>
map <leader>at :AT<CR>

"
" easymotion
"
map <localleader>f <Plug>(easymotion-bd-f)
map <localleader>F <Plug>(easymotion-overwin-f)

" " " Move to line
map <localleader>l <Plug>(easymotion-bd-jk)
map <localleader>L <Plug>(easymotion-overwin-jk)

" " " Move to word
map <localleader>w <Plug>(easymotion-bd-w)
map <localleader>W <Plug>(easymotion-overwin-w)

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config()) . '\v'
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'})) . '\v'
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1})) . '\v'

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzyword#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

map <silent><expr> z/ incsearch#go(<SID>config_easyfuzzymotion())

"
" vim-jsx
"
let g:jsx_ext_required = 0

"
" vimlocal
"
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 1
let g:localvimrc_whitelist=$HOME . '/utrust/platform/.lvimrc'

"
" omnisharp-vim
"
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_highlight_types = 1
" this only works while I just have a single C# project.
" Removing this option bumps into this issue: https://github.com/OmniSharp/omnisharp-vim/issues/398
let g:OmniSharp_port = 2000


"
" lazy loading plugins
"
augroup load_us_ycm
  autocmd!
  autocmd CursorHold,CursorHoldI * call plug#load('vim-test')
                      \| autocmd! load_us_ycm
augroup END
