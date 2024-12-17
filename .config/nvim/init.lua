-- Custom mappings
require("config.keymaps")
-- Lazy package manager
require("config.lazy")

-- Enables numbers
vim.opt.nu = true vim.opt.relativenumber = true

-- Disables swap
vim.opt.swapfile = false

-- Disables backup
vim.opt.backup = false

-- Sets undo folder
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Disables highlighting search and enables incremental search
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

-- Tab has size of 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true

-- highlight cursor line
vim.cmd("set cursorline")

-- Use system clipboard
vim.o.clipboard = "unnamedplus"

-- Set to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- True colors
vim.o.termguicolors = true

-- Better highlighting when copying text
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Spellchecking
vim.cmd("setlocal spell spelllang=en_us")
vim.cmd("set iminsert=0 imsearch=-1")

-- Vim movement in Greek language
vim.o.langmap =
	"ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"
