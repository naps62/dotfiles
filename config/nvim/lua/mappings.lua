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

-- save file
nmap("<C-s>", ":update<cr>")
imap("<C-s>", "<C-o>:update<cr><esc>")

-- file explorer
nmap("<C-n>", ":NvimTreeToggle<cr>")
nmap("<C-m>", ":NvimTreeFindFile<cr>")

-- fuzzy finder
nmap("<C-p>", "<cmd>Telescope find_files<cr>")
nmap("<C-f>", "<cmd>Rg<cr>")
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
nmap("fl", "<cmd>HopLineStart<cr>")
nmap("fp", "<cmd>HopPattern<cr>")
nmap("fw", "<cmd>HopWord<cr>")

-- hlslens
nmap("n", [[<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>]])
nmap("N", [[<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>]])
nmap("*", [[*<cmd>lua require('hlslens').start()<cr>]])
nmap("*", [[*<cmd>lua require('hlslens').start()<cr>]])
nmap("g*", [[g*<cmd>lua require('hlslens').start()<cr>]])
nmap("g#", [[g#<cmd>lua require('hlslens').start()<cr>]])

-- terminal
nmap("<leader>t", "<cmd>9ToggleTerm direction=float<cr>")
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
nmap("<S-k>", "<cmd>lua vim.lsp.buf.hover()<cr>")
nmap("gD", "<cmd>lua vim.lsp.buf.implementation()<cr>")
nmap("<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
nmap("1gD", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
nmap("gr", "<cmd>lua vim.lsp.buf.references()<cr>")
nmap("g0", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
nmap("gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>")
nmap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
nmap("g[", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
nmap("g]", "<cmd>lua vim.diagnostic.goto_next()<cr>")
-- code action
nmap("gf", require('lspsaga.finder').lsp_finder)
nmap("ga", require('lspsaga.codeaction').code_action)

nmap("<C-LeftMouse>", "<LeftMouse>gx<CR>")
