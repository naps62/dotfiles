augroup vimrc_plugin_fzf
  autocmd! FileType fzf
  autocmd  FileType fzf set nonu nornu
augroup END

let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(blue)%C(bold)%cr%C(white)"'
let $FZF_DEFAULT_OPTS='--layout=reverse --bind ctrl-a:select-all'

nmap <C-p> :FzfFiles<CR>
nmap <C-f> :FzfRg<CR>

" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"
" coc-fzf
"
nnoremap <silent> <leader>ca  :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <leader>cb  :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <leader>cc  :<C-u>CocFzfList commands<CR>
nnoremap <silent> <leader>ce  :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <leader>cl  :<C-u>CocFzfList location<CR>
nnoremap <silent> <leader>co  :<C-u>CocFzfList outline<CR>
nnoremap <silent> <leader>cs  :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <leader>cS  :<C-u>CocFzfList services<CR>
nnoremap <silent> <leader>cp  :<C-u>CocFzfListResume<CR>
