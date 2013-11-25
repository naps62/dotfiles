$pdf_mode        = 1;
$postscript_mode = 0;
$dvi_mode        = 0;
@default_files   = ('main.tex');
$pdf_previewer   = 'open %S 2> /dev/null > /dev/null';
$max_repeat=2;

# with rubber
#$pdflatex = 'rubber -c "setlist arguments --shell-escape" --force --pdf %S';

# without rubber
$pdflatex  = 'pdflatex -shell-escape %O %S';
