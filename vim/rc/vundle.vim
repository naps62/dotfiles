set nocompatible
filetype off

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" UI Features
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'

" Editor features
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch'
Plugin 'jiangmiao/auto-pairs'
Plugin 'thoughtbot/vim-rspec'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'msanders/snipmate.vim'

" Syntax-only plugins
Plugin 'slim-template/vim-slim'
Plugin 'rodjek/vim-puppet'
Plugin 'plasticboy/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-git'
Plugin 'wting/rust.vim'
Plugin 'vim-scripts/SyntaxRange'
Plugin 'elzr/vim-json'

call vundle#end()
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
let g:airline_theme = 'solarized'
let g:airline_theme_patch_func = 'AirlineThemePatch'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#bufferline#enabled = 1
"let g:bufferline_echo = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules\|tmp'
  \ }

" The Silver Searcher
if executable('ag')
  " use Ag over Grep
  set grepprg="ag --nogroup --nocolor"

  " use `ag` in ctrlp for listing files
  let g:ctrlp_User_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that ctrlp doesn't need to cache
  let g:ctrlp_use_caching = 0

  map <C-f> :Ag 
endif

" vim-json
let g:vim_json_syntax_conceal = 0

" syntastic
" let g:syntastic_disabled_filetypes=['slim', 'html']
let g:syntastic_slim_checkers = []

" vim-autoclose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']'}

" " snippetsEmu
" " are activated by Shift+Tab
" let g:snippetEmu_key = "<S-Tab>"
