" switch syntax highlight on when terminal has colors
if (&t_Co > 2 || has('gui_running')) && !exists('syntax_on')
  syntax on
endif

let base16colorspace=256
set t_Co=256

" " color scheme
set background=dark

colorscheme base16-eighties

" SignColumn with same color as line column
highlight clear SignColumn

" current line
set cursorline
set cursorcolumn

" vim-gitgutter bg color
highlight SignColumn ctermbg=black
highlight GitGutterAdd ctermbg=black
highlight GitGutterChange ctermbg=black
highlight GitGutterDelete ctermbg=black
highlight GitGutterChangeDelete ctermbg=black

" highlights
highlight Error ctermfg=red ctermbg=black
highlight Todo ctermfg=red ctermbg=black
highlight SpellCap ctermbg=black

" ale (code)
" highlight ALEError ctermfg=01 ctermbg=18
highlight SpellBad ctermfg=1 ctermbg=237

" highlight ALEError ctermfg=red ctermbg=black
" highlight ALEStyleErrorSign ctermfg=red ctermbg=black

" coc.nvim colors
highlight CocErrorHighlight cterm=underline ctermfg=01 ctermbg=18
highlight CocErrorFloat ctermfg=grey ctermbg=18

" coc-rust-analyzer
highlight CocRustChainingHint ctermfg=grey

" example of customizing floating windows
" hi Pmenu ctermfg=yellow ctermbg=black
" hi Pmenu ctermfg=yellow ctermbg=235 gui=underline guifg=#bcbcbc guibg=#262626
" hi PmenuSel ctermfg=yellow ctermbg=131 gui=underline guifg=#bcbcbc guibg=#af5f5f

" Generic error colors
" highlight Error ctermfg=red ctermbg=black
" highlight Warning ctermfg=yellow ctermbg=black

" line number column to match text bg
highlight LineNr ctermfg=darkgrey ctermbg=black

" search highligh
highlight Search ctermbg=darkgrey ctermfg=black

" spellchecker
highlight SpellBad cterm=NONE


function! TweakBase16()
  " Override the diff-mode highlights of base16.
  highlight DiffAdd    term=bold ctermfg=0 ctermbg=2 guifg=#2b2b2b guibg=#a5c261
  highlight DiffDelete term=bold ctermfg=0 ctermbg=1 gui=bold guifg=#2b2b2b guibg=#da4939
  highlight DiffChange term=bold ctermfg=0 ctermbg=4 guifg=#2b2b2b guibg=#6d9cbe
  highlight DiffText   term=reverse cterm=bold ctermfg=0 ctermbg=4 gui=bold guifg=#2b2b2b guibg=#6d9cbe
endfunction

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

