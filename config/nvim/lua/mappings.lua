vim.g.mapleader = " "

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

-- create new line at cursor position
nmap("<C-CR>", "i<CR>")

--
-- quickfix navigation
--
nmap("[q", "<cmd>:cprev<cr>")
nmap("]q", "<cmd>:cnext<cr>")

nmap("<C-LeftMouse>", "<LeftMouse>gx<CR>")
