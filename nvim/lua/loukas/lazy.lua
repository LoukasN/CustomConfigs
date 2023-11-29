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
		'nvim-telescope/telescope.nvim', version = '0.1.4',
		dependencies = {
			('nvim-lua/plenary.nvim')
		}
	},
	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/playground',
	'mhinz/vim-startify',
	'nvim-lualine/lualine.nvim',
	{'tpope/vim-Fugitive', event = "VeryLazy"},
	{'mbbill/undotree', event = "VeryLazy"},
	{'sudormrfbin/cheatsheet.nvim', event = "VeryLazy"},
	{'ThePrimeagen/harpoon', event = "VeryLazy"},
	{"catppuccin/nvim", name = 'catppuccin', priority = 1000},
	{"EdenEast/nightfox.nvim", priority = 1001},
	{"folke/tokyonight.nvim", priority = 1000},
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
	-- For university assingmets
	{'lervag/vimtex', event = "VeryLazy"},
}


require("lazy").setup(plugins)
