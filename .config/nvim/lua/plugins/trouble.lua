return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	vim.keymap.set("n", "<leader>t", function()
		require("trouble").toggle()
	end, { desc = "Open trouble" }),
}
