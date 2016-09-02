" leader maps
nnoremap <leader>t :15split /home/naps62/todo/todo.txt<CR>

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
map <leader>sr :call RunAllSpecs()<CR>
map <leader>ss :call RunNearestSpec()<CR>
map <leader>sf :call RunCurrentSpecFile()<CR>
map <leader>sl :call RunLastSpec()<CR>
" let g:neoterm_position = 'vertical'
" map <leader>sr :call neoterm#test#run('all')<CR>
" map <leader>ss :call neoterm#test#run('current')<CR>
" map <leader>sf :call neoterm#test#run('file')<CR>
" map <leader>sl :call neoterm#test#rerun()<CR>

" zoom / unzoom a vim pane
nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <leader>_ :wincmd =<CR>

" break out to the end of the line in insert mode
imap <C-a> <Esc>A
" break out to the next line in insert mode
imap <C-o> <Esc>o
