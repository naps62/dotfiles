if has("unix")
  so ~/.vim/rc/unix.vim
endif
so ~/.vim/rc/base.vim
so ~/.vim/rc/plugins.vim
so ~/.vim/rc/colors.vim
so ~/.vim/rc/maps.vim
so ~/.vim/rc/filetypes.vim
so ~/.vim/rc/functions.vim

function! s:EnsureStylesheetsDirectoryExists()
  execute ':silent !mkdir -p stylesheets'
  execute ':redraw!'
endfunction

function! s:AppendTemplate(buffer)
  let text = []
  call add(text, '.Text.Text--bold {')
  call add(text, '  font-weight: bold;')
  call add(text, '}')
  return append(a:buffer, text)
endfunction

function! s:ComponentName(name)
  echo a:name
endfunction

function! SuitCreate(name)
  let name = a:name
  call s:EnsureStylesheetsDirectoryExists()

  exec 'tabnew ' . name
  call s:AppendTemplate(0)
endfunction

command! -nargs=* SuitCreate call SuitCreate('<args>')
