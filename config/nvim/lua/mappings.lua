vim.g.mapleader = ' '

function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map("n", shortcut, command)
end

function imap(shortcut, command)
  map("i", shortcut, command)
end

function vmap(shortcut, command)
  map("v", shortcut, command)
end

function tmap(shortcut, command)
  map("t", shortcut, command)
end

function smap(shortcut, command)
  map("s", shortcut, command)
end

-- remove search highlight
nmap("<leader>,", ":noh<cr>")

-- buffer navigation
nmap("<C-h>", ":wincmd h<cr>")
nmap("<C-j>", ":wincmd j<cr>")
nmap("<C-k>", ":wincmd k<cr>")
nmap("<C-l>", ":wincmd l<cr>")

-- close current buffer
nmap("<leader>q", ":q<cr>")

-- switch between last two files
nmap("<tab>", ":b#<cr>")

-- go back to normal mode
imap("jj", "<esc>")
imap("jk", "<esc>")

-- save file
nmap("<C-s>", ":update<cr>")
imap("<C-s>", "<C-o>:update<cr><esc>")

-- file explorer
nmap("<C-n>", ":NvimTreeToggle<cr>")
nmap("<C-m>", ":NvimTreeFindFile<cr>")

-- fuzzy finder
nmap("<C-p>", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<cr>")
nmap("<C-f>", "<cmd>FzfRgSlim<cr>") -- custom command with more filters
nmap("<C-S-f>", "<cmd>Rg<cr>") -- regular command without filters
nmap("<C-.>", "<cmd>Telescope projects<cr>")

-- spectre (find/replace)
nmap("<leader>S", "<cmd>lua require('spectre').open()<cr>")
-- search current word
nmap("<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>")
vmap("<leader>s", "<esc>:lua require('spectre').open_visual()<cr>")
-- search in current file
nmap("<leader>sf", "viw:lua require('spectre').open_file_search()<cr>")

-- hop.nvim
nmap("ff", "<cmd>HopChar1<cr>")
nmap("2ff", "<cmd>HopChar2<cr>")
nmap("<leader>fl", "<cmd>HopLineStart<cr>")
nmap("<leader>fp", "<cmd>HopPattern<cr>")
nmap("<leader>fw", "<cmd>HopWord<cr>")

-- hlslens
nmap("n", [[<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>]])
nmap("N", [[<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>]])
nmap("*", [[*<cmd>lua require('hlslens').start()<cr>]])
nmap("*", [[*<cmd>lua require('hlslens').start()<cr>]])
nmap("g*", [[g*<cmd>lua require('hlslens').start()<cr>]])
nmap("g#", [[g#<cmd>lua require('hlslens').start()<cr>]])

-- terminal
-- nmap("<leader>t", "<cmd>9ToggleTerm direction=float<cr>")
nmap("<leader>t", "<cmd>Lspsaga term_toggle<cr>")
nmap("<leader>1t", "<cmd>1ToggleTerm direction=vertical<cr>")
nmap("<leader>2t", "<cmd>2ToggleTerm direction=vertical<cr>")
nmap("<leader>0t", "<cmd>ToggleTermToggleAll<cr>")
tmap("<C-e>", "<cmd>ToggleTermToggleAll<cr>")
nmap("<leader>g", "<cmd>lua _lazygit_toggle()<cr>")

-- luasnips
imap("<C-e>", "<cmd>luasnip#choice_active() ? ")
vim.cmd [[
  imap <silent><expr> <C-.> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  smap <silent><expr> <C-.> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]]

--
-- code navigation
--
nmap("<c-]>", "<cmd>lua vim.lsp.buf.definition()<cr>")
nmap("<c-}>", "<cmd>:vsplit | lua vim.lsp.buf.definition()<cr>")
nmap("<S-k>", "<cmd>lua vim.lsp.buf.hover()<cr>")
nmap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
-- nmap("gD", "<cmd>lua vim.lsp.buf.implementation()<cr>")
nmap("<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
nmap("1gD", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
nmap("gr", "<cmd>lua vim.lsp.buf.references()<cr>")
nmap("g0", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
nmap("gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>")

--
-- code action
nmap("gf", "<cmd>Lspsaga lsp_finder<cr>")
nmap("ga", "<cmd>Lspsaga code_action<cr>")
vmap("ga", "<cmd>Lspsaga code_action<cr>")
nmap("gr", "<cmd>Lspsaga rename<cr>")
nmap("gD", "<cmd>Lspsaga peek_definition<cr>")
-- nmap("gd", "<cmd>Lspsaga goto_definition<cr>")
nmap("g[", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
nmap("g]", "<cmd>Lspsaga diagnostic_jump_next<cr>")
nmap("go", "<cmd>Lspsaga outline<cr>")
-- nmap("K", "<cmd>Lspsaga hover_doc<cr>")
nmap("<leader>gi", "<cmd>Lspsaga incoming_calls<cr>")
nmap("<leader>go", "<cmd>Lspsaga outgoing_calls<cr>")

--
-- quickfix navigation
--
nmap("[q", "<cmd>:cprev<cr>")
nmap("]q", "<cmd>:cnext<cr>")
-- easier navigation while inside the quickfix itself
vim.cmd [[
function! QuickfixMapping()
  " Go to the previous location and stay in the quickfix window
  nnoremap <buffer> K :cprev<CR>zz<C-w>w

  " Go to the next location and stay in the quickfix window
  nnoremap <buffer> J :cnext<CR>zz<C-w>w

  " Make the quickfix list modifiable
  nnoremap <buffer> <leader>u :set modifiable<CR>

  " Save the changes in the quickfix window
  nnoremap <buffer> <leader>w :cgetbuffer<CR>:cclose<CR>:copen<CR>

  " Begin the search and replace
  nnoremap <buffer> <leader>r :cdo s/// \| update<C-Left><C-Left><Left><Left><Left>
endfunction

augroup quickfix_group
    autocmd!
    autocmd filetype qf call QuickfixMapping()
augroup END
]]

--
-- diagnostics
--
vim.g.virtualTextToggled = false
function toggleVirtualText()
  require('toggle_lsp_diagnostics').toggle_virtual_text()

  local rt = require('rust-tools')
  if vim.g.virtualTextToggled then
    rt.inlay_hints.enable()
    vim.g.virtualTextToggled = false
    print("LSP virtual text enabled")
  else
    rt.inlay_hints.disable()
    vim.g.virtualTextToggled = true
    print("LSP virtual text disabled")
  end
end

nmap("<leader>dd", toggleVirtualText)

-- align md tables
vim.cmd [[
  au FileType markdown map <Bar> vip :EasyAlign*<Bar><Enter>
]]

-- git-conflict.nvim
vim.keymap.set('n', 'co', '<Plug>(git-conflict-ours)')
vim.keymap.set('n', 'ct', '<Plug>(git-conflict-theirs)')
vim.keymap.set('n', 'cb', '<Plug>(git-conflict-both)')
vim.keymap.set('n', 'c0', '<Plug>(git-conflict-none)')
vim.keymap.set('n', ']x', '<Plug>(git-conflict-prev-conflict)')
vim.keymap.set('n', '[x', '<Plug>(git-conflict-next-conflict)')

nmap("<C-LeftMouse>", "<LeftMouse>gx<CR>")
