return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require("telescope.builtin")
			pcall(require('telescope').load_extension, 'fzf')
			vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "Find files"})
			vim.keymap.set('n', '<leader>pg', builtin.live_grep, {desc = "Grep in files"})
			-- Show buffers with telescope
			vim.keymap.set("n", "<leader>pb", builtin.buffers, {desc = "Show open buffers"})
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			}
			require("telescope").load_extension("ui-select")
		end
	},
	{
		"debugloop/telescope-undo.nvim",
		config = function()
			require("telescope").load_extension("undo")
			vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
		end
	},

}
