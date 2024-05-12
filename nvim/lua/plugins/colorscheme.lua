return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = false,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = false,
				},
			})
			-- vim.cmd.colorscheme "catppuccin"
		end,
	},

	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					transparent = false,
				},
			})
			vim.cmd.colorscheme "nightfox"
		end,
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = false,
				style = "night", -- storm, moon, night, day
			})
			-- vim.cmd.colorscheme "tokyonight"
		end,
	},

	{
		"Mofiqul/dracula.nvim",
		config = function()
			require("dracula").setup({
				transparent_bg = false,
			})
			-- vim.cmd.colorscheme("dracula")
			-- vim.cmd.colorscheme("dracula-soft")
		end,
	},
}
