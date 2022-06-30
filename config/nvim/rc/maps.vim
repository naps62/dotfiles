
" buffer navigation
" use ctrl-[hjkl] to select the active split
nmap <silent> <C-k>      :wincmd k<CR>
nmap <silent> <C-j>      :wincmd j<CR>
nmap <silent> <C-h>      :wincmd h<CR>
nmap <silent> <C-l>      :wincmd l<CR>
imap jj <Esc>

" close current buffer
nmap <silent> <leader>q :q<CR>

" switch between the last two files
map <Tab> :b#<CR>

" tab navigation
nnoremap <C-y> :tabprevious<CR>

" Ctrl-S save
noremap  <C-s>      :update<CR>
inoremap <C-s> <C-o>:update<CR><Esc>

" still able to save after forgetting to sudo
cmap w!! w !sudo tee % > /dev/null

" Move to beginning/end of line in insert mode
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

nmap <leader>d :call FindDoc()<CR>

nmap <leader>f :copen<CR>
