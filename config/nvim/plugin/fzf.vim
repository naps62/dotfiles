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
nmap <C-g> :FzfBuffers<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
