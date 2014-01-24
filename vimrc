" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
filetype plugin indent on

Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-commentary'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
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
Bundle 'scrooloose/syntastic'

" basics
set encoding=utf-8
set nocompatible  " disable Vi compatibility mode
set relativenumber " relative number on current line
set number         " line numbers
set ruler         " cursor position
set mouse=a       " mouse usage
set scrolloff=3   " scroll offset
set autowrite     " automatically :write before running commands
set showmode
set showcmd
"set wildmenu
set wildmode=list:longest
" set cursorline
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
colorscheme github

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

" key maps
nnoremap ; :
nnoremap , .
nmap <silent> <leader>ev :e  $HOME/.vimrc<CR> " edit vimrc
nmap <silent> <leader>sv :so $HOME/.vimrc<CR> " reload vimrc
cmap w!! w !sudo tee % > /dev/null  " still be able to save after forgetting to sudo

" tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>

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

" close current buffer, but keep slipt open
nmap <silent> <leader>q :Bclose<CR>
nmap <silent> <leader>wq :wq<CR>

" switch between the last two files
"nnoremap <leader><leader> <c-^>

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
inoremap <silent> <C-s> <C-o>:update<CR><Esc>

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

" change word is actually change inner word by default
map cw ciw

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
" let g:airline_theme = 'railscasts
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
endif

" vim/rspec
let g:rspec_command = "!bundle exec rspec --drb {spec}"

" vim-autoclose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']'}

" snippetsEmu
" are activated by Shift+Tab
let g:snippetEmu_key = "<S-Tab>"

" custom functions
function! MyAlignAt() range
  call Tabularize("\/" . nr2char(getchar()) . "\\zs")
endfunction


" SignColumn
" same color as line column
highlight clear SignColumn

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>
