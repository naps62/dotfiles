set nocompatible
filetype off

let $PYTHONPATH='/usr/lib/python3.4/site-packages'

" vundle
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle
Plug 'gmarik/vundle'

" UI Features
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
" Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
" Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'

" Editor features
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'jiangmiao/auto-pairs'
Plug 'thoughtbot/vim-rspec'
Plug 'Lokaltog/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'AndrewRadev/sideways.vim'
Plug 'dkprice/vim-easygrep'
Plug 'vim-scripts/gitignore'
Plug 'taiansu/nerdtree-ag'
Plug 'gregsexton/gitv'
Plug 'marijnh/tern_for_vim'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-projectionist'

" Syntax-only plugins
Plug 'slim-template/vim-slim'
Plug 'rodjek/vim-puppet'
Plug 'plasticboy/vim-markdown'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-git'
Plug 'wting/rust.vim'
Plug 'vim-scripts/SyntaxRange'
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'
Plug 'nicholaides/words-to-avoid.vim'
Plug 'rhysd/vim-crystal'
Plug 'hail2u/vim-css3-syntax'
Plug 'Slava/vim-spacebars'
Plug 'digitaltoad/vim-jade'
Plug 'pangloss/vim-javascript'

call plug#end()
filetype plugin indent on

" NERDTree
map <C-n> :NERDTreeToggle<CR>
"let g:NERDTreeDirArrows=0
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
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#bufferline#enabled = 0
"let g:bufferline_echo = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

" lightline
let g:lightline = {
  \ 'colorscheme': 'base16-default',
  \ 'separator': { 'left': '⮀', 'right': '⮂'  },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃'  }
  \ }



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

" syntastic
" let g:syntastic_disabled_filetypes=['slim', 'html']
" let g:syntastic_slim_checkers = []
" let g:syntastic_javascript_checkers = ['eslint']

" neomake
autocmd! BufWritePost * Neomake

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

" sideways.vim
nmap <C-w> :SidewaysLeft<CR>
nmap <C-e> :SidewaysRight<CR>

" vim-gitgutter
let g:gitgutter_sign_column_always = 1
