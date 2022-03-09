filetype off

let $PYTHONPATH='/usr/lib/python3.4/site-packages'

" vundle
call plug#begin('~/.config/nvim/plugged')

let g:coc_global_extensions = [
  \ 'coc-elixir',
  \ 'coc-json',
  \ 'coc-rust-analyzer',
  \ 'coc-sh',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-solargraph',
  \ 'coc-stylelintplus',
  \ 'coc-snippets',
  \ 'coc-jedi'
  \ ]

let g:polyglot_disabled = ['solidity', 'markdown']

" Theme
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
" Plug 'NLKNguyen/papercolor-theme'

" UI Features
" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-vinegar'
Plug 'wakatime/vim-wakatime'

" Find & Replace
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'stefandtw/quickfix-reflector.vim'


" Unit testing
Plug 'vim-test/vim-test'
Plug 'kassio/neoterm'
Plug 'skywind3000/asyncrun.vim'

" Editor features
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'kana/vim-textobj-user'
Plug 'andymass/vim-matchup'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'embear/vim-localvimrc'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'antoinemadec/coc-fzf'
Plug 'gabrielpoca/replacer.nvim'
Plug 'junegunn/vim-easy-align'

" Navigation
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'wellle/targets.vim'
Plug 'pechorin/any-jump.vim'

" Write mode
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'markdown.mdx'] }
Plug 'junegunn/limelight.vim', { 'for': ['markdown', 'markdown.mdx'] }
Plug 'vim-voom/VOoM', { 'for': ['markdown', 'markdown.mdx'] }

" Linters
Plug 'dense-analysis/ale'

" Ruby
Plug 'tpope/vim-bundler',    { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" Elixir
Plug 'tpope/vim-endwise',    { 'for': ['ruby', 'elixir'] }
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'

" HTML
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'javascript.jsx', 'typescript', 'javascript.tsx', 'typescript.tsx'] }

" Other syntaxes
Plug 'vim-scripts/SyntaxRange'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'sheerun/vim-polyglot'
Plug 'TovarishFin/vim-solidity'
" Plug 'miguelmota/cairo.vim'
Plug 'starkware-libs/cairo-lang', { 'rtp': 'src/starkware/cairo/lang/ide/vim' }
Plug 'starkware-libs/cairo-lang', { 'rtp': 'src/starkware/cairo/lang/ide/vim' }

call plug#end()
filetype plugin indent on

"
" treesitter
"
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
" ensure_installed = {"javascript"},     -- one of "all", "language", or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = {},  -- list of language that will be disabled
"   },
"   refactor = {
"     highlight_definitions = { enable = true },
"     highlight_current_scope = { enable = true },
"   },
" }
" EOF

" markdown
let g:markdown_fenced_languages = ['elixir', 'sh', 'rust']

"
" delimitMate
"
let g:delimitMate_expand_cr = 2

"
" neoterm
"
let g:neoterm_size='70'
let g:neoterm_default_mod = 'vertical'
let g:neoterm_autoscroll = 1
let g:neoterm_repl_ruby = 'pry'
let g:neoterm_keep_term_open = 1

nnoremap <silent> <leader>th :call neoterm#close()<CR>
nnoremap <silent> <leader>tl :call neoterm#clear()<CR>
nnoremap <silent> <leader>tk :call neoterm#kill()<CR>
tmap <silent> <C-e> <C-\><C-n>

"
" quick-scope
"
let g:qs_max_chars=80

"
" vim-test
"
let test#strategy = 'neoterm'

let test#custom_runners = {'typescript': ['hardhat']}

map <leader>sr :TestSuite<CR>
map <leader>ss :TestNearest<CR>
map <leader>sf :TestFile<CR>
map <leader>sl :TestLast<CR>
map <leader>sv :TestVisit<CR>

"
" asyncrunc
"
let g:asyncrun_open = 8

" augroup vimrc
"     autocmd QuickFixCmdPost * botright copen 8
" augroup END

"
" fugitive.vim (git wrapper)
"
set diffopt+=vertical
map <leader>gs :Git<CR>
map <leader>gb :Git blame<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gw :Gbrowse<CR>

"
" lightline
"
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
  \ 'colorscheme': 'PaperColor',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ },
  \ }

"
" ripgrep
"
if executable('rg')
  " use Ripgrep over Grep
  set grepprg="rg --color never --no-heading"
endif

"
" vim-gitgutter
"
let g:gitgutter_override_sign_column_highlight = 0

"
" vim-projectionist
"
map <leader>aa :A<CR>
nmap <leader>av :AV<CR>
map <leader>as :AS<CR>
map <leader>at :AT<CR>

"
" easymotion
"
map <localleader>f <Plug>(easymotion-bd-f)
map <localleader>F <Plug>(easymotion-overwin-f)

" " " Move to line
map <localleader>l <Plug>(easymotion-bd-jk)
map <localleader>L <Plug>(easymotion-overwin-jk)

" " " Move to word
map <localleader>w <Plug>(easymotion-bd-w)
map <localleader>W <Plug>(easymotion-overwin-w)

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config()) . '\v'
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'})) . '\v'
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1})) . '\v'

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzyword#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

map <silent><expr> z/ incsearch#go(<SID>config_easyfuzzymotion())

"
" vim-jsx
"
let g:jsx_ext_required = 0

"
" vimlocal
"
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 1
let g:localvimrc_whitelist=[
      \ $HOME . '/subvisual/nft/.lvimrc',
      \ $HOME . '/sandclock/solidity-contracts/.lvimrc',
      \ $HOME . '/lightshift/ichi/ichi-oneToken/.lvimrc'
      \ ]

"
" vim-replacer
"
nmap <leader>h :lua require("replacer").run()<cr>

"
" cairo.vim
"
let g:cairo_linter_autosave = 1

"
" lazy loading plugins
"
augroup load_us_ycm
  autocmd!
  autocmd CursorHold,CursorHoldI * call plug#load('vim-test')
                      \| autocmd! load_us_ycm
augroup END
