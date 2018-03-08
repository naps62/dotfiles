" switch syntax highlight on when terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" " color scheme
if $THEME == "dark"
  set background=dark

  " SignColumn with same color as line column
  highlight clear SignColumn

  " vim-gitgutter bg color
  highlight SignColumn ctermbg=black
  highlight GitGutterAdd ctermbg=black
  highlight GitGutterChange ctermbg=black
  highlight GitGutterDelete ctermbg=black
  highlight GitGutterChangeDelete ctermbg=black

  " YCM sign colors
  highlight YcmErrorSign ctermfg=red ctermbg=black
  highlight YcmWarningSign ctermfg=red ctermbg=black

  " Generic error colors
  highlight Error ctermfg=red ctermbg=black
  highlight Warning ctermfg=yellow ctermbg=black

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
else
  set background=light
  let base16colorspace=256
  colorscheme lucius
  highlight Cursor ctermfg=white ctermbg=black
endif
