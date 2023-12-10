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
	{
		'nvim-telescope/telescope.nvim', version = '0.1.x',
		dependencies = {
			('nvim-lua/plenary.nvim')
		}
	},
	'nvim-treesitter/nvim-treesitter',
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	'nvim-treesitter/playground',
	'mhinz/vim-startify',
	'nvim-lualine/lualine.nvim',
	{'tpope/vim-Fugitive', event = "VeryLazy"},
	{'mbbill/undotree', event = "VeryLazy"},
	{'sudormrfbin/cheatsheet.nvim', event = "VeryLazy"},
	{'ThePrimeagen/harpoon', event = "VeryLazy"},
	{"catppuccin/nvim", name = 'catppuccin', priority = 1000},
	{"EdenEast/nightfox.nvim", priority = 1000},
	{"folke/tokyonight.nvim", priority = 1000},
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
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
	-- latex plugin for neovim
	{'lervag/vimtex', event = "VeryLazy"},
}


require("lazy").setup(plugins)
