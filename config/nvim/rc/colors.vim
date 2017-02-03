" switch syntax highlight on when terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" " color scheme
if $THEME == "dark"
  set background=dark
  let base16colorspace=256
  colorscheme base16-default-dark

  " SignColumn
  " same color as line column
  " highlight clear SignColumn
  " highlight clear LineNr
  " highlight clear CursorLineNr
  " highlight CursorLineNr ctermfg=darkgrey
  " hi SignColumn guibg=darkgrey
  highlight LineNr ctermfg=darkgrey
  highlight Search ctermbg=blue ctermfg=black
  highlight MatchParen ctermbg=blue ctermfg=black

  function! TweakBase16()
    " Override the diff-mode highlights of base16.
    highlight DiffAdd    term=bold ctermfg=0 ctermbg=2 guifg=#2b2b2b guibg=#a5c261
    highlight DiffDelete term=bold ctermfg=0 ctermbg=1 gui=bold guifg=#2b2b2b guibg=#da4939
    highlight DiffChange term=bold ctermfg=0 ctermbg=4 guifg=#2b2b2b guibg=#6d9cbe
    highlight DiffText   term=reverse cterm=bold ctermfg=0 ctermbg=4 gui=bold guifg=#2b2b2b guibg=#6d9cbe
  endfunction
else
  set background=light
  let base16colorspace=256
  colorscheme lucius
endif
