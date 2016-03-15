set nocompatible
filetype off

let $PYTHONPATH='/usr/lib/python3.4/site-packages'

" vundle
call plug#begin('~/.vim/plugged')

" UI Features
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe'
Plug 'benekastah/neomake'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'airblade/vim-gitgutter'
Plug 'unblevable/quick-scope'
Plug 'chrisbra/NrrwRgn'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'

" Editor features
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'kana/vim-textobj-user'
Plug 'wakatime/vim-wakatime'
Plug 'freitass/todo.txt-vim'
Plug 'wellle/targets.vim'
Plug 'scrooloose/syntastic'
Plug 'amperser/proselint', { 'rtp': 'plugins/vim/syntastic_proselint' }
Plug '~/.vim/plugged/custom'

" Ruby
Plug 'tpope/vim-rails',      { 'for': 'ruby' }
Plug 'tpope/vim-rake',       { 'for': 'ruby' }
Plug 'tpope/vim-endwise',    { 'for': 'ruby' }
Plug 'tpope/vim-bundler',    { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" JS
Plug 'marijnh/tern_for_vim',    { 'for': 'javascript', 'on': 'TernDef' }
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
let g:NERDTreeShowHidden=1
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
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

" fugitive.vim (git wrapper)
set diffopt+=vertical
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gw :Gbrowse<CR>
map <leader>gg :Git 

" statusline
let g:airline_extensions = ['tabline', 'quickfix', 'nrrwrgn', 'syntastic']
let g:airline_powerline_fonts = 1
 let g:airline#extensions#tabline#show_buffers = 0

" The Silver Searcher
if executable('ag')
  " use Ag over Grep
  set grepprg="ag --nogroup --nocolor"
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
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:ycm_key_detailed_diagnostics = ''

" vim-gitgutter
let g:gitgutter_sign_column_always = 1

" greplace.vim
let g:grep_cmd_opts = '--line-numbers --noheading'

" auto-pairs
let g:AutoPairsMultilineClose = 0

" Vim Tmux Runner
" unmap <leader>vo
" unmap <leader>vs
nnoremap <leader>co :VtrOpenRunner {'orientation': 'h', 'percentage': 30}<CR>
nnoremap <leader>cs :VtrSendLinesToRunner<CR>
vnoremap <leader>cs :VtrSendLinesToRunner<CR>
nnoremap <leader>cc :VtrSendCommandToRunner q<CR>:VtrClearRunner<CR>:VtrSendCommandToRunner 

" fzf
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(blue)%C(bold)%cr%C(white)"'
nmap <C-p> :Files<CR>
nmap <C-f> :Ag<CR>

" Syntastic

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
      \  'mode': 'passive',
      \ 'active_filetypes': ['ruby', 'gitcommit'],
      \ 'passive_filetypes': []
      \ }
let g:syntastic_markdown_checkers = ['mdl', 'proselint']
let g:syntastic_gitcommit_checkers = ['mdl', 'proselint']
let g:syntastic_text_checkers = ['proselint']
let g:syntastic_html_checkers = ['tidy', 'proselint']
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
map <Leader>y :SyntasticCheck<CR>

" easymotion
" Move to character
map <Leader><Leader>f <Plug>(easymotion-bd-f)
" Move to line
map <Leader><Leader>l <Plug>(easymotion-bd-jk)
" Move to word
map <Leader><Leader>w <Plug>(easymotion-bd-w)
" Move up/down
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)

" vim-markdonw
