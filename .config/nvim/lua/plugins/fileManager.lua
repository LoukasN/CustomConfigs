return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})
		vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<cr>")
		local api = require("nvim-tree.api")
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true }
		end
		vim.keymap.set("n", "<leader><cr>", api.tree.change_root_to_node, opts("cd"))
		-- Disabling Netrw
		vim.g.loaded_netrw       = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
