if has('python3')
  silent! python3 1
endif


so ~/.config/nvim/rc/unix.vim
so ~/.config/nvim/rc/base.vim

if !exists('g:vscode')
  so ~/.config/nvim/rc/plugins.vim
  so ~/.config/nvim/rc/colors.vim
  so ~/.config/nvim/rc/maps.vim
endif
