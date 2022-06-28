" switch syntax highlight on when terminal has colors
if (&t_Co > 2 || has('gui_running')) && !exists('syntax_on')
  syntax on
endif

set t_Co=256

" current line
set cursorline
set cursorcolumn
