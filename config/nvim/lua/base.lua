vim.opt.scrolloff = 5
vim.opt.clipboard = "unnamedplus"
vim.opt.guifont = "FiraCode Nerd Font Mono:h12"
vim.opt.cmdheight = 0
vim.opt.shortmess = "csCFSW"

vim.g.mapleader = " "

-- layout
vim.opt.splitbelow = true
vim.opt.splitright = true

-- mouse
vim.opt.mouse = "a"

-- indentation & tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.smartindent = true

-- line breaking
vim.opt.linebreak = true

-- line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- search options
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.gdefault = true

-- completion
vim.api.nvim_exec2(
	[[
  set completeopt=menuone,noinsert,noselect
  set shortmess+=c
]],
	{}
)
vim.opt.updatetime = 300

-- highligh white spaces
vim.opt.list = true

vim.opt.fillchars:append({ diff = " " })
