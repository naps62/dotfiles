" basics

set encoding=utf-8
set ruler         " cursor position
set scrolloff=5   " scroll offset
set autowrite     " automatically :write before running commands
set cursorline    " highlight current line
set showmode
set showcmd
set hidden
"set wildmenu
set wildmode=list:longest
set ttyfast
set lazyredraw
set laststatus=2
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set noerrorbells
set clipboard=unnamedplus " X11 clipboard integration

set shell=/bin/zsh

map <Space> <leader>
let maplocalleader = ','

" open split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" layout
set signcolumn=yes
set cmdheight=1

" indentation without hard tabs
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround    " always indent to a multiple of shiftwidth

" smart indentation
set autoindent  " copy indentation from previous line
set smartindent " auto add 1 indentation level in some cases

" line breaking
set wrap
set linebreak

set foldmethod=indent
setlocal foldlevel=20
setlocal foldlevelstart=20

" relative line numbering
set number
set relativenumber
" autocmd BufEnter * set relativenumber

" redraw
nnoremap <C-l> :redraw<cr>

" search
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>, :noh<cr>

set incsearch     " incremental seach
set hlsearch      " highligh search results
set showmatch
set ignorecase    " case insensitive search
set smartcase     " case sensitive search if at least one uppercase is used
set gdefault      " use /g (replace all on line instead of first) by default

" text wrap
set formatoptions=qrn1
set colorcolumn=80

" undo buffer
set history=50          " remember more commands and search history
set undolevels=1000     " use many levels of undo
set undoreload=1000    " maximum lines to save for undo
set undofile            " store undo info in a .un~ file
set undodir=~/.config/nvim/undo " store undo files in a common dir

" no swap files
set nobackup
set nowritebackup
set noswapfile

" highlight white space
set list
set listchars=""
set listchars+=tab:>\ 
set listchars+=trail:•
set listchars+=extends:#
set listchars+=nbsp:•

set re=0

" when editing a file, always jump to the last known cursor position
" don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim)
augroup vim_rc_autojump
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g `\"" |
    \ endif
augroup END

set ttimeoutlen=50

set updatetime=2000

set noequalalways
