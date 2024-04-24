return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000 ,
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
		end
	},

	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			require('nightfox').setup({
				options = {
					transparent = true,
				}
			})
			vim.cmd.colorscheme "terafox"
		end
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				style = "storm" -- storm, moon, night, day
			})
			-- vim.cmd.colorscheme "tokyonight"
		end
	},

	{
		"Mofiqul/dracula.nvim",
		config = function()
			-- vim.cmd.colorscheme "dracula"
			-- vim.cmd.colorscheme "dracula-soft"
		end
	}

}
