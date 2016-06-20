let s:bcs = b:current_syntax

unlet b:current_syntax
syntax include @PHP syntax/sh.vim
unlet b:current_syntax
syntax include @SQL syntax/sql.vim

let b:current_syntax = s:bcs

" syntax region hereDocText    matchgroup=Statement start=+<<[-~.]*\z([A-Z]\+\)+ end=+^\s*\z1+ contains=NONE
" syntax region hereDocDashSQL matchgroup=Statement start=+<<[-~.]*\z(SQLDOC\)+  end=+^\s*\z1+ contains=@SQL " syntax region hereDocDashPHP matchgroup=Statement start=+<<[-~.]*\z(PHPDOC\)+  end=+^\s*\z1+ contains=@PHP
