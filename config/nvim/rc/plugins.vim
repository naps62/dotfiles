set nocompatible
filetype off

let $PYTHONPATH='/usr/lib/python3.4/site-packages'

" vundle
call plug#begin('~/.config/nvim/plugged')

" UI Features
" Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'chriskempson/base16-vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'unblevable/quick-scope'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'ref': 'c65e2ead639d2d72577d8726ba14526fc2824ba3' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'kreskij/vim-reminder-tips'

" Editor features
Plug 'chrisbra/NrrwRgn'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'
Plug 'neomake/neomake'
Plug 'w0rp/ale'
Plug 'amperser/proselint'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'takac/vim-hardtime'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise',    { 'for': ['ruby', 'elixir'] }
Plug 'tpope/vim-bundler',    { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }
" Plug 'slashmili/alchemist.vim'

" JS
Plug 'marijnh/tern_for_vim',    { 'for': 'javascript', 'on': 'TernDef' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',             { 'for': ['javascript', 'javascript.jsx'] }

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'Shougo/vimproc.vim', { 'for': ['typescript'], 'do': 'make' }
Plug 'Quramy/tsuquyomi', { 'for': ['typescript'] }

" HTML
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'javascript.jsx', 'typescript'] }
Plug 'slim-template/vim-slim', { 'for': 'slim' }

Plug 'elzr/vim-json',    { 'for': 'json' }

" Other syntaxes
Plug 'tpope/vim-git'
Plug 'nicholaides/words-to-avoid.vim'
Plug 'vim-scripts/SyntaxRange'
Plug 'plasticboy/vim-markdown', { 'for': ['md', 'markdown'] }
Plug 'tomlion/vim-solidity'

" Write mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-scripts/VOoM'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'rhysd/vim-grammarous'

call plug#end()
filetype plugin indent on


" NERDTree
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeKeepTreeInNewTab=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeMapOpenVSplit="v"
let g:NERDTreeMapOpenSplit="s"
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowLineNumbers = 1
" close vim if NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Bookmark shortcut
map <silent> <c-b> :Bookmark<CR>

" TODO this is being overriden by status line
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

" vim-emmet
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'jsx',
\  },
\}

" neoterm
let g:neoterm_position='vertical'
let g:neoterm_size='60'
let g:neoterm_autoscroll = 1
let g:neoterm_repl_ruby = 'pry'
let g:neoterm_keep_term_open = 1

nnoremap <silent> <leader>th :call neoterm#close()<CR>
nnoremap <silent> <leader>tl :call neoterm#clear()<CR>
nnoremap <silent> <leader>tk :call neoterm#kill()<CR>
tmap <silent> <C-e> <C-\><C-n>

" vim-test
let test#strategy = "neoterm"

map <leader>sr :TestSuite<CR>
map <leader>ss :TestNearest<CR>
map <leader>sf :TestFile<CR>
map <leader>sl :TestLast<CR>

" Ability to run elixir tests while on their alternate file
let test#elixir#exunit#file_pattern = '\.ex'

function! ElixirDocTestTransformation(cmd) abort
  if a:cmd =~ "mix test" && a:cmd !~ "_test.exs"
    let final_cmd = substitute(a:cmd, "lib\/", "test/", "")
    let final_cmd = substitute(final_cmd, ".ex", "_test.exs", "")
    return final_cmd
  else
    return a:cmd
  end
endfunction

let g:test#custom_transformations = {'elixir_doctest': function('ElixirDocTestTransformation')}
let g:test#transformation = 'elixir_doctest'

" fugitive.vim (git wrapper)
set diffopt+=vertical
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gw :Gbrowse<CR>

" nrrwrgn
let g:nrrw_rgn_wdth = 30
let g:nrrw_topbot_leftright = 'botright'

" statusline
let g:airline_extensions = ['tabline', 'quickfix', 'nrrwrgn']
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#windowswap#enabled = 0

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_detect_spell = 0
let g:airline_detect_iminsert = 0
let g:airline_mode_map = {
  \ '__': '_',
  \ 'n' : 'N',
  \ 'i' : 'I',
  \ 'R' : 'R',
  \ 'c' : 'C',
  \ 'v' : 'V',
  \ 'V' : 'V',
  \ '^V': 'V',
  \ 's' : 'S',
  \ 'S' : 'S',
  \ '^S': 'S',
  \ }

" c section - file readonly
let g:airline_section_c = airline#section#create(['%f', ' ', 'readonly'])
" z section - line:column
let g:airline_section_z = airline#section#create(['%#__accent_bold#', '%l', ':', '%#__restore__#', '%v'])

" ripgrep
if executable('rg')
  " use Ripgrep over Grep
  set grepprg="rg --color never --no-heading"
endif

" auto-pairs
let g:AutoPairsMultilineClose = 0
let g:AutoPairsOnlyWhitespace = 1

" YouCompleteMe
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_detailed_diagnostics = ''
" syntax checking is done by other tools (neomake, ale, etc, so we don't want
" them here)
let g:ycm_show_diagnostics_ui = 0

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" vim-gitgutter
set signcolumn=yes
let g:gitgutter_override_sign_column_highlight = 0

" fzf
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(blue)%C(bold)%cr%C(white)"'
nmap <C-p> :Files<CR>
nmap <C-f> :Ag<CR>

" neomake
" let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_css_enabled_makers = ['']
" let g:neomake_ruby_enabled_makers = ['rubocop']
" let g:neomake_elixir_enabled_makers = ['credo']
" let g:neomake_typescript_enabled_makers = ['tslint']
" let g:neomake_tsx_enabled_makers = ['tslint']

let g:neomake_warning_sign = {'text': '→'}
let g:neomake_error_sign = {'text': '→'}
let g:ycm_warning_symbol = '→'
let g:ycm_error_symbol = '→'

let g:neomake_prose_maker = {
  \ 'exe': 'proselint',
  \ 'args': ['%:p'],
  \ 'errorformat': '%f:%l:%c %m',
  \ }

" autocmd! BufWritePost * Neomake

" ale
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_emit_conflict_warnings = 0
let g:ale_ruby_rubocop_options = '--except Lint/Debugger'

let g:ale_sign_error = '→'
let g:ale_sign_warning = '→'
let g:ale_fix_on_save = 1
let g:ale_linters = {
      \ 'ruby': [],
      \ 'elixir': [],
      \ 'typescript': ['tslint', 'tsserver'],
      \ 'javascript': [],
      \ 'scss': [],
      \ 'solidity': ['solium'],
      \ }

let g:ale_fixers = {
      \ 'ruby':  [],
      \ 'typescript': ['tslint', 'tsserver', 'prettier'],
      \ 'javascript': [],
      \ 'elixir': ['mix_format'],
      \ 'solidity': [],
      \ }

function! AddLinterIfFileExists(lang, linter, file, lint, fix)
  let l:current = g:ale_linters[a:lang]

  if filereadable(a:file) && index(l:current, a:linter) == -1
    if a:lint
      let g:ale_linters[a:lang] = g:ale_linters.javascript + [a:linter]
    endif
    if a:fix
      let g:ale_fixers[a:lang] = g:ale_linters.javascript + [a:linter]
    end
  endif
endfunction

call AddLinterIfFileExists('javascript', 'eslint', '.eslintrc.json', 1, 1)
call AddLinterIfFileExists('javascript', 'standard', 'node_modules/.bin/standard', 1, 1)
call AddLinterIfFileExists('javascript', 'prettier', 'node_modules/.bin/prettier', 1, 1)
call AddLinterIfFileExists('scss', 'stylelint', '.stylelintrc', 1, 0)
call AddLinterIfFileExists('ruby', 'rubocop', '.rubocop.yml', 1, 1)
call AddLinterIfFileExists('elixir', 'credo', 'config/.credo.exs', 1, 0)


" vim-projectionist
map <leader>aa :A<CR>
nmap <leader>av :AV<CR>
map <leader>as :AS<CR>
map <leader>at :AT<CR>

" easymotion
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

" vim-jsx
let g:jsx_ext_required = 0

" hardtime
let g:hardtime_default_on = 1
let g:hardtime_timeout = 500
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]

" lazy loading plugins

augroup load_us_ycm
  autocmd!
  autocmd CursorHold,CursorHoldI * call plug#load('vim-test')
                      \| autocmd! load_us_ycm
augroup END
