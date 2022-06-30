filetype off

let $PYTHONPATH='/usr/lib/python3.4/site-packages'

" vundle
call plug#begin('~/.config/nvim/plugged')

" UI Features
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdtree'

" Find & Replace
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'

" UI
Plug 'NLKNguyen/papercolor-theme'

" Editor features
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'kana/vim-textobj-user'
Plug 'andymass/vim-matchup'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kassio/neoterm'

" Navigation
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Linters
Plug 'dense-analysis/ale'

Plug 'sheerun/vim-polyglot'

call plug#end()
filetype plugin indent on
