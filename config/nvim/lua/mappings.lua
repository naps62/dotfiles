vim.g.mapleader = ' '

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map("n", shortcut, command)
end

function imap(shortcut, command)
  map("i", shortcut, command)
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

-- fuzzy finder
nmap("<C-p>", "<cmd>Telescope find_files<cr>")
nmap("<C-f>", "<cmd>Telescope grep_string<cr>")
nmap("<C-.>", "<cmd>Telescope repo cached_list<cr>")

-- hop.nvim
nmap("ff", "<cmd>HopChar1<cr>")
nmap("2ff", "<cmd>HopChar2<cr>")
nmap("fl", "<cmd>HopLineStart<cr>")
nmap("fp", "<cmd>HopPattern<cr>")
nmap("fw", "<cmd>HopWord<cr>")

-- hlslens
nmap("n",  [[<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>]])
nmap("N",  [[<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>]])
nmap("*",  [[*<cmd>lua require('hlslens').start()<cr>]])
nmap("*",  [[*<cmd>lua require('hlslens').start()<cr>]])
nmap("g*",  [[g*<cmd>lua require('hlslens').start()<cr>]])
nmap("g#",  [[g#<cmd>lua require('hlslens').start()<cr>]])
