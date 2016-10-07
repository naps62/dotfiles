" switch syntax highlight on when terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" " color scheme
set background=light
let base16colorspace=256
colorscheme lucius
