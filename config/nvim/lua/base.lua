vim.opt.scrolloff = 5
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
-- TODO vim.opt.clipboard = ???

-- layout
vim.opt.splitbelow = true
vim.opt.splitright = true

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
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.gdefault = true

-- undo buffer
vim.opt.history = 50
vim.opt.undolevels = 1000
vim.opt.undoreload = 1000
vim.opt.undofile = true
vim.opt.undodir = "~/.config/nvim/undo"

-- no swap files
--vim.opt.nobackup = true
--vim.opt.nowritebackup = true
--vim.opt.noswapfile = true

-- highligh white spaces
vim.opt.list = true
