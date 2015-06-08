" switch syntax highlight on when terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" " color scheme
set background=dark
let base16colorspace=256
"colorscheme base16-default

" SignColumn
" same color as line column
highlight clear SignColumn
