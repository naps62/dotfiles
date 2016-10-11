set nocompatible
filetype off

let $PYTHONPATH='/usr/lib/python3.4/site-packages'

" vundle
call plug#begin('~/.vim/plugged')

" UI Features
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Valloric/YouCompleteMe'
Plug 'chriskempson/base16-vim'
Plug 'johathanfilip/vim-lucius'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'airblade/vim-gitgutter'
Plug 'unblevable/quick-scope'
Plug 'chrisbra/NrrwRgn'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'ref': 'c65e2ead639d2d72577d8726ba14526fc2824ba3' }
Plug 'SirVer/ultisnips'
Plug 'blueyed/vim-diminactive'

" Plug '~/projects/vim-cleanup'

" Editor features
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'eapache/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'kana/vim-textobj-user'
Plug 'wakatime/vim-wakatime'
Plug 'wellle/targets.vim'
Plug 'neomake/neomake'
Plug 'amperser/proselint'
Plug '~/.vim/plugged/custom'

" Ruby
Plug 'tpope/vim-rails',      { 'for': 'ruby' }
Plug 'tpope/vim-rake',       { 'for': 'ruby' }
Plug 'tpope/vim-endwise',    { 'for': ['ruby', 'elixir'] }
Plug 'tpope/vim-bundler',    { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" JS
Plug 'marijnh/tern_for_vim',    { 'for': 'javascript', 'on': 'TernDef' }
Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'Slava/vim-spacebars',     { 'for': 'html' }
Plug 'digitaltoad/vim-jade',    { 'for': 'jade' }
Plug 'mxw/vim-jsx',             { 'for': 'javascript.jsx' }

" HTML
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'mattn/emmet-vim', { 'for': 'html' }

Plug 'elzr/vim-json',    { 'for': 'json' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'suan/vim-instant-markdown'

" Other syntaxes
Plug 'tpope/vim-git'
Plug 'vim-less', { 'for': 'less' }
Plug 'dag/vim2hs', { 'for': 'haskell' }
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
Plug 'tpope/vim-cucumber', { 'for': ['cucumber', 'feature'] }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }
Plug 'plasticboy/vim-markdown', { 'for': ['md', 'markdown'] }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'nicholaides/words-to-avoid.vim'
Plug 'vim-scripts/SyntaxRange'
Plug 'docker/docker', { 'rtp': '/contrib/syntax/vim/' }
Plug 'freitass/todo.txt-vim', { 'for': 'todo' }
Plug 'amadeus/vim-mjml', { 'for': 'mjml' }

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
" close vim if NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Bookmark shortcut
map <silent> <c-b> :Bookmark<CR>

" TODO this is being overriden by status line
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

" neoterm
let g:neoterm_position='vertical'
let g:neoterm_size='60'

" vim-test
let test#strategy = "neoterm"

map <leader>sr :TestSuite<CR>
map <leader>ss :TestNearest<CR>
map <leader>sf :TestFile<CR>
map <leader>sl :TestLast<CR>

" fugitive.vim (git wrapper)
set diffopt+=vertical
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gw :Gbrowse<CR>
map <leader>gg :Git 

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

" The Silver Searcher
if executable('rg')
  " use Ripgrep over Grep
  set grepprg="rg --color never --no-heading"
endif

" vim-autoclose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']'}

" YouCompleteMe
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:ycm_key_detailed_diagnostics = ''

" vim-gitgutter
let g:gitgutter_sign_column_always = 1
let g:gitgutter_override_sign_column_highlight = 0

" greplace.vim
let g:grep_cmd_opts = '--line-numbers --noheading'

" auto-pairs
let g:AutoPairsMultilineClose = 0

" fzf
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(blue)%C(bold)%cr%C(white)"'
nmap <C-p> :Files<CR>
nmap <C-f> :Ag<CR>

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_css_enabled_makers = ['scss_lint']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_elixir_enabled_makers = ['credo']
let g:neomake_less_enabled_makers = []
let g:neomake_warning_sign = {'text': '▶'}
let g:neomake_error_sign = {'text': '▶'}

autocmd! BufWritePost * Neomake
map <Leader>y :Neomake!<CR>

" vim-projectionist
map <leader>aa :A<CR>
nmap <leader>av :AV<CR>
map <leader>as :AS<CR>
map <leader>at :AT<CR>

" vim-rails
map <leader>rr :R<CR>
map <leader>rv :RV<CR>
map <leader>rs :RS<CR>
map <leader>rt :RT<CR>

" easymotion
" Move to character
map <Leader>ff <Plug>(easymotion-bd-f)
" " Move to line
map <Leader>fl <Plug>(easymotion-bd-jk)
" " Move to word
map <Leader>fw <Plug>(easymotion-bd-w)
" " Move up/down
map <Leader>fj <Plug>(easymotion-j)
map <Leader>fk <Plug>(easymotion-k)

" auto-pairs
let g:AutoPairsOnlyWhitespace = 1
