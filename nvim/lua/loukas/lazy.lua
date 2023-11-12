local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", --latest/stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	'nvim-telescope/telescope.nvim', tag = '0.1.2',
	('nvim-lua/plenary.nvim'),
	('nvim-treesitter/nvim-treesitter'),
	('nvim-treesitter/playground'),
	('mbbill/undotree'),
	('tpope/vim-Fugitive'),
	('mhinz/vim-startify'),
	('sudormrfbin/cheatsheet.nvim'),
	('ThePrimeagen/vim-be-good'),
	('ThePrimeagen/harpoon'),
	{ "catppuccin/nvim", name = 'catppuccin', priority = 1000 },
	("EdenEast/nightfox.nvim"),
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	},
}


require("lazy").setup(plugins)
