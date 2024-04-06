return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000 ,
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
			vim.cmd.colorscheme "catppuccin"
		end
	},

	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "nightfox"
			require('nightfox').setup({
				options = {
					transparent = true,
				}
			})
			-- vim.cmd.colorscheme "terafox"
		end
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				style = "moon" -- storm, moon, night, day
			})
			-- vim.cmd.colorscheme "tokyonight"
		end
	}
}
