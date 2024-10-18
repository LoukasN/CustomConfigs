return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
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
					transparent = true,
				},
			})
			-- vim.cmd.colorscheme("carbonfox")
			-- vim.cmd.colorscheme("dawnfox")
			-- vim.cmd.colorscheme("dayfox")
			-- vim.cmd.colorscheme("duskfox")
			vim.cmd.colorscheme("nightfox")
			-- vim.cmd.colorscheme("nordfox")
		end,
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = false,
				style = "moon", -- storm, moon, night, day
			})
			-- vim.cmd.colorscheme "tokyonight"
		end,
	},

	{
		"Mofiqul/dracula.nvim",
		config = function()
			require("dracula").setup({
				transparent_bg = true,
			})
			-- vim.cmd.colorscheme("dracula")
			-- vim.cmd.colorscheme("dracula-soft")
		end,
	},
}
