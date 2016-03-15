" leader maps
nnoremap <leader>t :15split /home/naps62/Dropbox/todo.txt<CR>

" key maps
nnoremap ; :
nnoremap , .
nnoremap <silent> <leader>ev :tabe $HOME/.vimrc<CR> " edit vimrc
nnoremap <silent> <leader>sv :so $HOME/.vimrc<CR> " reload vimrc

" still able to save after forgetting to sudo
cmap w!! w !sudo tee % > /dev/null

" buffer navigation
" use ctrl-[hjkl] to select the active split
nmap <silent> <C-k>      :wincmd k<CR>
nmap <silent> <C-j>      :wincmd j<CR>
nmap <silent> <C-h>      :wincmd h<CR>
nmap <silent> <C-l>      :wincmd l<CR>
imap <silent> <c-k> <Esc>:wincmd k<CR>i
imap <silent> <c-j> <Esc>:wincmd j<CR>i
imap <silent> <c-h> <Esc>:wincmd h<CR>i
imap <silent> <c-l> <Esc>:wincmd l<CR>i

" close current buffer
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>wq :wq<CR>

" switch between the last two files
map <Tab> :b#<CR>

" tab navigation
nnoremap <C-u> :tabprevious<CR>
nnoremap <C-i> :tabnext<CR>

" go back after jumping to tag
" nmap <C-[> :pop<CR>

" disable F1
inoremap <F1> <ESC>
inoremap <F1> <ESC>
inoremap <F1> <ESC>

" Ctrl-S save
noremap  <C-s>      :update<CR>
vnoremap <C-s> <C-c>:update<CR>
inoremap <C-s> <C-o>:update<CR><Esc>

" rake / spec
map <leader>r :call RunAllSpecs()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>f :call RunCurrentSpecFile()<CR>
map <leader>l :call RunLastSpec()<CR>

" zoom / unzoom a vim pane
nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <leader>= :wincmd =<CR>

" vim-projectionist
map <leader>aa :A<CR>
nmap <leader>av :AV<CR>
map <leader>as :AS<CR>
map <leader>at :AT<CR>
