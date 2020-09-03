augroup vim_rc_autocmds
  au BufNewFile,BufRead *.slim   set filetype=slim
  au BufNewFile,BufRead *.coffee set filetype=coffee
  au BufNewFile,BufRead *.pp     set filetype=puppet
  au BufNewFile,BufRead *.scala  set filetype=scala
  au BufNewFile,BufRead *.cap    set filetype=ruby
  au BufNewFile,BufRead Capfile  set filetype=ruby
  au BufNewFile,BufRead Puppetfile set filetype=ruby
  au BufNewFile,BufRead Vagrantfile set filetype=ruby
  au BufNewFile,BufRead *.thor   set filetype=ruby
  au BufNewFile,BufRead *.ejs    set filetype=eruby.html
  au BufNewFile,BufRead *.md     set filetype=markdown
  au BufNewFile,BufRead *.rs     set filetype=rust
  au BufNewFile,BufRead *.es6    set filetype=javascript
  au BufNewFile,BufRead *.less.partial set filetype=less
  au BufNewFile,BufRead xmobarrc set filetype=haskell
  au BufNewFile,BufRead *.json.tpl set syntax=json
  au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
augroup END

" remove trailing whitespaces on save,
" only for the given filetypes
let g:remove_trailing_whitespaces_whitelist = [
  \ '*.ex',
  \ '*.exs',
  \ '*.rb',
  \ '*.js?',
  \ '*.ts?',
  \ ]
execute 'autocmd BufWritePre ' .
  \ join(g:remove_trailing_whitespaces_whitelist, ',') .
  \ ' call RemoveTrailingWhitespaces()'
