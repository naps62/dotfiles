" vundle
set rtp+=~/.vim/bundle/vundle/
try
  call vundle#rc()
catch
endtry

if exists(':Vundle')
endif

so ~/.vimrc.local
