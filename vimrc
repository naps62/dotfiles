" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
filetype plugin indent on

" UI Features
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'altercation/vim-colors-solarized'

" Editor features
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-dispatch'
Bundle 'Townk/vim-autoclose'
" Bundle 'tsaleh/vim-matchit'
Bundle 'thoughtbot/vim-rspec'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/emmet-vim'
Bundle 'ervandew/supertab'

" Syntax-only plugins
Bundle 'slim-template/vim-slim'
Bundle 'rodjek/vim-puppet'
Bundle 'plasticboy/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-git'

" basics
set encoding=utf-8
set nocompatible  " disable Vi compatibility mode
set number        " line numbers
set ruler         " cursor position
set mouse=a       " mouse usage
set scrolloff=3   " scroll offset
set autowrite     " automatically :write before running commands
set cursorline    " highlight current line
set showmode
set showcmd
"set wildmenu
set wildmode=list:longest
set ttyfast
set lazyredraw
set laststatus=2
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set noerrorbells
set clipboard=unnamedplus " X11 clipboard integration
let mapleader=","

" open split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" indentation without hard tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set shiftround    " always indent to a multiple of shiftwidth

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
set history=50          " remember more commands and search history
set undolevels=1000     " use many levels of undo
set undoreload=1000    " maximum lines to save for undo
set undofile            " store undo info in a .un~ file
set undodir=~/.vim/undo " store undo files in a common dir

" no swap files
set nobackup
set nowritebackup
set noswapfile

" highlight white space
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.   " show whitespace...
autocmd filetype html,xml set listchars-=tab:>. " ... except for some file types

" switch syntax highlight on when terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set re=1
au BufNewFile,BufRead *.slim   set filetype=slim
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.pp     set filetype=puppet
au BufNewFile,BufRead *.scala  set filetype=scala
au BufNewFile,BufRead *.cap    set filetype=ruby
au BufNewFile,BufRead Capfile  set filetype=ruby
au BufNewFile,BufRead Puppetfile set filetype=ruby
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au BufNewFile,BufRead *.ejs    set filetype=eruby.html
au BufNewFile,BufRead *.md     set filetype=markdown

" when editing a file, always jump to the last known cursor position
" don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim)
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g `\"" |
  \ endif

" color scheme
set background=light
let g:solarized_termcolors=256
colorscheme solarized

" key maps
nnoremap ; :
nnoremap , .
nmap <silent> <leader>ev :tabe $HOME/.vimrc<CR> " edit vimrc
nmap <silent> <leader>sv :so $HOME/.vimrc<CR> " reload vimrc
cmap w!! w !sudo tee % > /dev/null  " still be able to save after forgetting to sudo

" buffer navigation
" use ctrl-[hjkl] to select the active split
nmap <silent> <C-k>      :wincmd k<CR>
nmap <silent> <C-j>      :wincmd j<CR>
nmap <silent> <C-h>      :wincmd h<CR>
nmap <silent> <C-l>      :wincmd l<CR>
imap <silent> <c-k> <Esc>:wincmd k<CR>i
imap <silent> <c-j> <Esc>:wincmd j<CR>i
imap <silent> <c-h> <Esc>:wincmd h<CR>i
imap <silent> <c-l> <Esc>:wincmd l<CR>i

" close current buffer
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>wq :wq<CR>

" switch between the last two files
nmap <Tab> :b#<CR>

" tab navigation
nnoremap <C-u> :tabprevious<CR>
nnoremap <C-i> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" go back after jumping to tag
" nmap <C-[> :pop<CR>

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
inoremap <silent> <C-s> <C-o>:update<CR><Esc>

" rake / spec
map <leader>r :call RunAllSpecs()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>f :call RunCurrentSpecFile()<CR>
map <leader>l :call RunLastSpec()<CR>

" change word is actually change inner word by default
map cw ciw

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

" vim-rspec
" let g:rspec_command = "compiler rspec | Dispatch rspec {spec}"
let g:rspec_command = "!spring rspec {spec}"

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
  \ 'dir': 'node_modules|tmp'
  \ }

" The Silver Searcher
if executable('ag')
  " use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use `ag` in ctrlp for listing files
  let g:ctrlp_User_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that ctrlp doesn't need to cache
  let g:ctrlp_use_caching = 0

  map <C-f> :Ag 
endif

" vim-autoclose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']'}

" snippetsEmu
" are activated by Shift+Tab
let g:snippetEmu_key = "<S-Tab>"

" SignColumn
" same color as line column
highlight clear SignColumn
