" basics
set encoding=utf-8
set nocompatible  " disable Vi compatibility mode
set number        " line numbers
set ruler         " cursor position
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
set clipboard=unnamed " X11 clipboard integration
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

" redraw
nnoremap <C-l> :redraw<cr>

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

set re=1

" when editing a file, always jump to the last known cursor position
" don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim)
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g `\"" |
  \ endif