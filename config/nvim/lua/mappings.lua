vim.g.mapleader = " "

local function map(mode, shortcut, command)
	vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
	map("n", shortcut, command)
end

local function imap(shortcut, command)
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
imap("jk", "<esc>")

-- save file
nmap("<C-s>", ":update<cr>")
imap("<C-s>", "<C-o>:update<cr><esc>")

-- create new line at cursor position
nmap("<C-CR>", "i<CR>")

--
-- quickfix navigation
--
nmap("[q", "<cmd>:cprev<cr>")
nmap("]q", "<cmd>:cnext<cr>")

nmap("<C-LeftMouse>", "<LeftMouse>gx<CR>")
