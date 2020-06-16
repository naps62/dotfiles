
" buffer navigation
" use ctrl-[hjkl] to select the active split
nmap <silent> <C-k>      :wincmd k<CR>
nmap <silent> <C-j>      :wincmd j<CR>
nmap <silent> <C-h>      :wincmd h<CR>
nmap <silent> <C-l>      :wincmd l<CR>

" close current buffer
nmap <silent> <leader>q :q<CR>

" switch between the last two files
map <Tab> :b#<CR>

" tab navigation
" nnoremap <C-u> :tabprevious<CR>
" nnoremap <C-i> :tabnext<CR>

" Ctrl-S save
noremap  <C-s>      :update<CR>
inoremap <C-s> <C-o>:update<CR><Esc>

" zoom / unzoom a vim pane
nnoremap <leader>z :call FoldToggle()<CR>

" still able to save after forgetting to sudo
cmap w!! w !sudo tee % > /dev/null

" Rename the current file
map <Leader>r :call Rename()<CR>

" Move to beginning/end of line in insert mode
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" vim-racer
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END
