-- header key
vim.g.mapleader = " "

-- open file search
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "File search"})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Go to error
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Go to fix
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Enables numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Disables Swapfile
vim.opt.swapfile = false

-- Disables backup
vim.opt.backup = false

-- Sets undo folder
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Disables highligting search and enables incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colors
vim.opt.termguicolors = true

-- Visible lines before scrolling
vim.opt.scrolloff = 12

-- No sidebars
vim.opt.signcolumn = "no"

-- faster update time
vim.opt.updatetime = 50

-- leader key
vim.g.mapleader = " "

-- Tab has size of 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true

-- Vim movement in greek language
vim.o.langmap = "ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"

---------- From nvim-lua/kickstart.nvim ----------

-- Use system clipboard
vim.o.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- True colors
vim.o.termguicolors = true

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Better highlighting when copying text
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
