augroup vimrc_plugin_defx
  autocmd!
  autocmd VimEnter * call s:setup()
  autocmd FileType defx call s:defx_mappings()
  autocmd BufLeave,BufWinLeave defx call defx#call_action('add_session')
augroup END

"
" setup
"
function! s:setup() abort
  silent! call defx#custom#option('_', {
        \ 'columns': 'git:indent:icons:filename:type',
        \ })
endfunction

"
" global mappings
"
nnoremap <silent><C-n> :call DefxOpen()<CR>
nnoremap <silent><C-m> :call DefxFind()<CR>

"
" defx buffer mappings
"
function! s:defx_mappings() abort
  " quitting
 nnoremap <silent><buffer><expr> q defx#do_action('quit')
 nnoremap <silent><buffer> <C-n> :quit<CR>
 nnoremap <silent><buffer> <C-m> :quit<CR>
 nnoremap <silent><buffer> <Esc> :quit<CR>

 " opening files / directories
 nnoremap <silent><buffer> <CR> :call Defx_open()<CR>
 nnoremap <silent><buffer> e :call Defx_do_and_quit('drop', [])<CR>
 nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])

 " opening in splits
 nnoremap <silent><buffer> v :call Defx_do_and_quit('drop', 'vsplit')<CR>
 nnoremap <silent><buffer> s :call Defx_do_and_quit('drop', 'split')<CR>

 " file operations
 nnoremap <silent><buffer><expr> c defx#do_action('copy')
 nnoremap <silent><buffer><expr> m defx#do_action('move')
 nnoremap <silent><buffer><expr> p defx#do_action('paste')
 nnoremap <silent><buffer><expr> r defx#do_action('rename')
 nnoremap <silent><buffer><expr> d defx#do_action('remove')
 nnoremap <silent><buffer><expr> n defx#do_action('new_file')
 nnoremap <silent><buffer><expr> N defx#do_action('new_directory')

 nnoremap <silent><buffer><expr> P defx#do_action('preview')

 nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')

 " wrap-around navigation
 nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
 nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
endfunction

"
" private functions
"
function! DefxOpen()
  call s:floating_defx('')
endfunction

function! DefxFind()
  call s:floating_defx('-search=' . expand('%:p'))
endfunction

function s:floating_defx(args)
  let width = 50
  let height = float2nr(&lines - (&lines * 2 / 10))
  let y = float2nr(&lines * 1 / 10)
  let x = float2nr((&columns - width) / 2)
  let float_opts = {
        \ 'relative': 'editor',
        \ 'row': y,
        \ 'col': x,
        \ 'width': width,
        \ 'height': height
        \ }
  let buf = nvim_create_buf(v:false, v:true)
  call nvim_open_win(buf, v:true, float_opts)

  let s:defx_base_args = " -session-file='/tmp/defx-session' -buffer-name='defx'"

  execute(printf("Defx %s %s", s:defx_base_args, a:args))
endfunction


function Defx_open()
  if defx#is_directory()
    call defx#call_action('open_or_close_tree')
  else
    call Defx_do_and_quit('drop', [])
  endif
endfunction

function Defx_do_and_quit(cmd, opt)
  let l:buf = bufnr('%')
  call defx#call_action('add_session')
  call defx#call_action(a:cmd, a:opt)
  execute("bdelete " . l:buf)
endfunction
