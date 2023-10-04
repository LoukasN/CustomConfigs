--Enables numbers
vim.opt.nu = true
vim.opt.relativenumber = true

--Disables Swapfile
vim.opt.swapfile = false

--Disables backup
vim.opt.backup = false

--Sets undo folder
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--Disables highligting search and enables incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

--Colors
vim.opt.termguicolors = true

--Visible lines before scrolling
vim.opt.scrolloff = 16
--No sidebars
vim.opt.signcolumn = "no"

--faster update time
vim.opt.updatetime = 50

--leader key
vim.g.mapleader = " "

--Copying into the system clipboard
vim.api.nvim_set_option("clipboard","unnamed")

--Tab has size of 4
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.smartindent=true
