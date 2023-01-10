vim.cmd [[let g:rooter_patterns = ['.git'] ]]

vim.cmd [[let g:copilot_node_command = "~/.asdf/installs/nodejs/16.17.0/bin/node" ]]

vim.cmd [[
  command! -bang -nargs=* FzfRgSlim call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --ignore-file lib/ -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
]]

vim.cmd [[
  command! -bang -nargs=* FzfRgSlim call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --ignore-file lib/ -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
]]
