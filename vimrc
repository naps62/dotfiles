" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
filetype plugin indent on

Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-git'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'plasticboy/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tsaleh/vim-matchit'
Bundle 'slim-template/vim-slim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'godlygeek/tabular'
Bundle 'rodjek/vim-puppet'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-abolish'

" basics
set encoding=utf-8
set nocompatible  " disable Vi compatibility mode
set number        " line numbers
set ruler         " cursor position
set mouse=a       " mouse usage
set scrolloff=3   " scroll offset
set showmode
set showcmd
"set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set lazyredraw
set laststatus=2
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set noerrorbells
let mapleader=","

syntax enable
set re=1
au BufNewFile,BufRead *.slim   set filetype=slim
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.pp     set filetype=puppet
au BufNewFile,BufRead *.scala  set filetype=scala
au BufNewFile,BufRead *.cap    set filetype=ruby
au BufNewFile,BufRead Capfile  set filetype=ruby
au BufNewFile,BufRead Puppetfile set filetype=ruby

" color scheme
set background=light
let g:solarized_termcolors=256
colorscheme solarized

" indentation without hard tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" smart indentation
set autoindent  " copy indentation from previous line
set smartindent " auto add 1 indentation level in some cases

" line breaking
set wrap
set linebreak

" search
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
set incsearch     " incremental seach
set hlsearch      " highligh search results
set showmatch
set ignorecase    " case insensitive search
set smartcase     " case sensitive search if at least one uppercase is used
set gdefault      " use /g (replace all on line instead of first) by default

" text wrap
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=100

" undo buffer
set history=1000       " remember more commands and search history
set undolevels=1000     " use many levels of undo
set undoreload=1000    " maximum lines to save for undo
set undofile            " store undo info in a .un~ file
set undodir=~/.vim/undo " store undo files in a common dir

" no swap files
set nobackup
set noswapfile

" highlight white space
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.   " show whitespace...
autocmd filetype html,xml set listchars-=tab:>. " ... except for some file types

" key maps
nnoremap ; :
nnoremap , .
nmap <silent> <leader>ev :e  $HOME/.vimrc<CR> " edit vimrc
nmap <silent> <leader>sv :so $HOME/.vimrc<CR> " reload vimrc
cmap w!! w !sudo tee % > /dev/null  " still be able to save after forgetting to sudo

" buffer navigation
" use ctrl-[hjkl] to select the active split
nmap <silent> <c-k>      :wincmd k<CR>
nmap <silent> <c-j>      :wincmd j<CR>
nmap <silent> <c-h>      :wincmd h<CR>
nmap <silent> <c-l>      :wincmd l<CR>
imap <silent> <c-k> <Esc>:wincmd k<CR>i
imap <silent> <c-j> <Esc>:wincmd j<CR>i
imap <silent> <c-h> <Esc>:wincmd h<CR>i
imap <silent> <c-l> <Esc>:wincmd l<CR>i

" tab navigation
nmap <silent> <C-t>      :tabnew<CR>

" navigate in wrapped lines
nnoremap j gj
nnoremap k gk

" disable F1
inoremap <F1> <ESC>
inoremap <F1> <ESC>
inoremap <F1> <ESC>

" Ctrl-S save
noremap  <silent> <C-s>      :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>

" tab navigation
"nnoremap <C-q> :tabprevious<CR>
"nnoremap <C-e> :tabnext<CR>
"nnoremap <C-w> :tabnew<CR>
"inoremap <C-j> <Esc>:tabprevious<CR>i
"inoremap <C-k> <Esc>:tabnext<CR>i
"inoremap <C-t> <Esc>:tabnew<CR>"

" rake / spec
map <leader>r :Rake<CR>
map <leader>s :.Rake<CR> " run current spec or feature
map <leader>t :Rake<CR>  " run current file

" align
map <leader>A :call MyAlignAt()<CR>

" <leader>-c copy from clipboard
" <leader>-v paste from clipboard
" <leader>-x cut to clipboard
map <leader>c "+y
map <leader>v "+p
map <leader>x "+d

" NERDTree
map <C-n> :NERDTreeToggle<CR>
"let g:NERDTreeDirArrows=0
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" fugitive.vim (git wrapper)
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gw :Gbrowse<CR>
map <leader>gg :Git 

" statusline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#bufferline#enabled = 1
"let g:bufferline_echo = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules'
  \ }

" custom functions
function! MyAlignAt() range
  call Tabularize("\/" . nr2char(getchar()) . "\\zs")
endfunction

" vim/rspec
let g:rspec_command = "!bundle exec rspec --drb {spec}"

" vim-autoclose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']'}
