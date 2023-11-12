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
vim.opt.scrolloff = 12

--No sidebars
vim.opt.signcolumn = "no"

--faster update time
vim.opt.updatetime = 50

--leader key
vim.g.mapleader = " "

--Tab has size of 4
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.smartindent=true

--Use system clipboard
vim.o.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
