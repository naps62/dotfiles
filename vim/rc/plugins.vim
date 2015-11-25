set nocompatible
filetype off

let $PYTHONPATH='/usr/lib/python3.4/site-packages'

" vundle
call plug#begin('~/.vim/plugged')

" UI Features
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'taiansu/nerdtree-ag', { 'on': 'NERDTreeToggle' }
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'unblevable/quick-scope'
Plug 'chrisbra/NrrwRgn'

" Editor features
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'dkprice/vim-easygrep'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Lokaltog/vim-easymotion'

" Ruby
Plug 'tpope/vim-rails',      { 'for': 'ruby' }
Plug 'tpope/vim-rake',       { 'for': 'ruby' }
Plug 'tpope/vim-bundler',    { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }

" JS
Plug 'marijnh/tern_for_vim',    { 'for': 'javascript', 'on': 'TernDef' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'Slava/vim-spacebars',     { 'for': 'html' }
Plug 'digitaltoad/vim-jade',    { 'for': 'jade' }

" HTML
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'mattn/emmet-vim', { 'for': 'html' }

Plug 'elzr/vim-json',    { 'for': 'json' }
Plug 'cespare/vim-toml', { 'for': 'toml' }

" Other syntaxes
Plug 'tpope/vim-git'
Plug 'vim-less', { 'for': 'less' }
Plug 'dag/vim2hs', { 'for': 'haskell' }
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
Plug 'tpope/vim-cucumber', { 'for': ['cucumber', 'feature'] }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'plasticboy/vim-markdown', { 'for': ['md', 'markdown'] }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'nicholaides/words-to-avoid.vim'
Plug 'vim-scripts/SyntaxRange'

call plug#end()
filetype plugin indent on

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeKeepTreeInNewTab=1
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeMapOpenVSplit="v"
let g:NERDTreeMapOpenSplit="s"
" close vim if NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Bookmark shortcut
map <silent> <c-b> :Bookmark<CR>

" TODO this is being overriden by status line
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

" vim-rspec
let g:rspec_command = "Dispatch rspec {spec}"

" fugitive.vim (git wrapper)
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gw :Gbrowse<CR>
map <leader>gg :Git 

" statusline
let g:airline_extensions = ['tabline', 'quickfix', 'nrrwrgn']
let g:airline_powerline_fonts = 1
 let g:airline#extensions#tabline#show_buffers = 0

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules\|tmp'
  \ }

" The Silver Searcher
if executable('ag')
  " use Ag over Grep
  set grepprg="ag --nogroup --nocolor"

  " use `ag` in ctrlp for listing files
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that ctrlp doesn't need to cache
  let g:ctrlp_use_caching = 0

  map <C-f> :Ag 
endif

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_css_enabled_makers = ['scss_lint']
let g:neomake_ruby_enabled_makers = ['rubocop']

" vim-autoclose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']'}

" YouCompleteMe
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"

imap <T-a> ads

" vim-gitgutter
let g:gitgutter_sign_column_always = 1

" greplace.vim
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" auto-pairs
let g:AutoPairsMultilineClose = 0
